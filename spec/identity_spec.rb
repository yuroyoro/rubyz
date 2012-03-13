# -*- coding: utf-8 -*-

# Scalazがよくわからんので
#
#  一人Scalaz Advent Calendar
#  http://partake.in/events/4b3afdc8-e4ec-4010-b8ec-31b89210dda0
#
# をRubyで写経してみる誰得企画
#
# No.1 Identity
#   http://basking-cat.blogspot.com/2011/12/identity.html
require 'spec_helper'

describe 'Identitys' do
  describe 'mkIdentity' do
    pending
  end

  describe 'unMkIdentity' do
    pending
  end
end

describe Scalaz::Identity do

  describe '？？' do
    let(:default) { "Scalaちゃん" }

    subject { reciever.？？ default }

    context 'when reciever is nil' do
      let(:reciever) { nil }

      it { should == default }
    end

    context 'when reciever is a String' do
      let(:reciever) { "Scalaz"}

      it { should == reciever }
    end

    context 'when reciever is a Fixnum' do
      let(:reciever) { 99 }

      it { expect { subject }.to raise_error TypeError }
    end
  end

  describe '｜＞' do
    context 'when block given' do
      let(:f) { lambda{|v| v + 1 } }
      subject { 1.｜＞(&f) }

      it { should == 2 }
    end

    context 'when Proc given' do
      let(:f) { lambda{|v| v + 1 } }
      subject { 1.｜＞(f) }

      it { should == 2 }
    end
  end

  describe 'some' do
    subject { reciever.some }

    let(:reciever) { "Scalaz"}
    it { should be_a_kind_of Scalaz::Some}
  end

  describe 'pair' do
    subject { reciever.pair }

    let(:reciever) { "ゲソ" }
    it { should == [reciever, reciever] }
  end

  describe 'whileDo' do
    let(:predicate) { lambda{|v| v < 10} }
    subject { 1.whileDo(predicate) {|v| v + 1 } }

    it { should == 10 }
  end

  describe 'whileDo' do
    let(:predicate) { lambda{|v| v < 10} }
    subject { 1.doWhile(predicate) {|v| v + 1 } }

    it { should == 10 }
  end
end
