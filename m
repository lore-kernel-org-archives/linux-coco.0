Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4DD47CA80
	for <linux-coco@lists.linux.dev>; Tue, 18 Aug 2026 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069857; cv=none; b=ZZxGB8psuIU4jSTRXruLfyqcQo1SNLgtDiz1tAAWWpqze3zHEXhuO0ZGWD4vZH9y4m+fnefEJbXe3CJrYH8kpCMbZ30xfbUamMsXoIrXG4vshfFYpHXJ1ia/+nntmYFkQ9OElgQqQunqRQRif35bBPISNYUgcE1Vd6x7wTtJJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069857; c=relaxed/simple;
	bh=OaMjAIRYRRWnaB4Urk/B3hfxETMkq3K2buSJHt/3KVA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j7xYsD9+k+FSrCxgSclH+NlFb2K4Bp/KjdB3lL7MuJGtUu6JD/U6OaYP5+qglL0fzcl9wCyDLq4+tf7nhLVlpbsEZF7RKGX59qIb0lW53xZQYDXF7c2GTAHlqgw3SxW7mrB06jk57HnFtcGqVquA2h6uHLuHH+mtLu3hZQIAlmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R4VHHkm7; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R4VHHkm7"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e1da97175so162703b3a.0
        for <linux-coco@lists.linux.dev>; Tue, 18 Aug 2026 09:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787069856; x=1787674656; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAGErQQAr795zwyVPFpnw68vb4Hwl1w2+fI9d1XhTw8=;
        b=R4VHHkm7hj2GBFZSkqSlbzC+CkHpidwQ0X1ba71jqBKf9Bx4Z6Pmizr3j6rIQjLSDQ
         o76TkIb4lTQW7VudGw1E/vVlM6Dt7tGebD+eSbRAEvtBl6iV/M5ZmCHqz6JQJTcrrvT0
         5Fm45h9/3FaeznChga5JNre5zV1CXBB9xFpuL5VzbdgIZ+B+NCL5pg5YeQHm4+svkMA5
         MOGNCLGtpMOI3unHCrq+9oa2uqIf+dIS1HXnscT8BFYeaTQNOpBP4eJBEwyN/sGNGUQf
         dIkxVtRzu0WXi6RDa+iglgNs+RukUYXB0w01PLF9h2QJDuPdwVnUAWrSehzvxu6LCXLu
         Bibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787069856; x=1787674656;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAGErQQAr795zwyVPFpnw68vb4Hwl1w2+fI9d1XhTw8=;
        b=UeZkjT7KaL4S63dmbAIyDTqxwl7PzqkB9iO+XuGEGJKojWPHQ9XvsJJ+RbgtFYHD4E
         +tthSUgPhyUiJbY/othDrvsB33W5fgi9QvnAz4iRhqroYfH8nYOdSfdUjFhmWs/y1y+V
         8T1PK8omcx5FN6cFJwen+kynMAZtAMf5CbEhaY1Q71X0fBE1JbNrx1xq0DXtopfz80jQ
         O3/+SAn2C4QyemX+ka6E7Umcd8WoojijXm+iPJqyiTeNLr2k+Mr5dOZthbUANRNS9z8I
         vnG55o7bDf1JP/o1mkp4xaIXYAkkevMWSal+ZEfXhvB1yN8UYKOiluJ6Glq2MnF2YEtI
         1gbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrovaIpgHYnYJjhypCjHNNJx/cvg9QgTwTbfx8GvrRM7TJN1rcb5hFgCj9nl5E5Fs+Mv0Jame04AU1S@lists.linux.dev
X-Gm-Message-State: AOJu0YzNkBNSRZlvTc1+4qztRIXb8b5QQvgQOfPGJyTIW2C3YyX0Dufj
	5RIM9iPReNzd6B19kbucw+S4OctOl9Ugj6Lej8roTqcBMFax+Kl4uYXW+e+llK60W9Af10kylfH
	uBqfEVw==
X-Received: from pfbkx25.prod.google.com ([2002:a05:6a00:6f19:b0:847:8449:eef1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e85:b0:842:7296:dba
 with SMTP id d2e1a72fcca58-84fddfa8508mr34166484b3a.7.1787069855548; Tue, 18
 Aug 2026 09:17:35 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:17:34 -0700
In-Reply-To: <94990aef-8b17-4bc6-a5d5-e7da5107d001@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260812080229.2481439-1-xiaoyao.li@intel.com>
 <20260812080229.2481439-5-xiaoyao.li@intel.com> <868c0d3c792d789347c767031612977c31cc227f.camel@intel.com>
 <1cf47118-2a19-44d5-ab74-b4c7ffa8890c@intel.com> <an3YFiDbjRs3PUwn@google.com>
 <77567574-d26c-4d2c-b5ce-5da28a7178d6@intel.com> <an84cenJjf7EqhVM@google.com>
 <1dcbf1b2-dc89-4624-b98e-d34f40558cfb@intel.com> <aoNNiAbZUbkWoZ6t@google.com>
 <94990aef-8b17-4bc6-a5d5-e7da5107d001@intel.com>
Message-ID: <aoSFnjABS8HCtWWS@google.com>
Subject: Re: [PATCH v3 4/4] KVM: TDX: Enable Bus Lock VM exit
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kas@kernel.org" <kas@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 18, 2026, Xiaoyao Li wrote:
> On 8/18/2026 2:06 AM, Sean Christopherson wrote:
> > On Sat, Aug 15, 2026, Xiaoyao Li wrote:
> > > On 8/14/2026 11:46 PM, Sean Christopherson wrote:
> > > > On Fri, Aug 14, 2026, Xiaoyao Li wrote:
> > > > > On 8/13/2026 10:43 PM, Sean Christopherson wrote:
> > > > > > On Thu, Aug 13, 2026, Xiaoyao Li wrote:
> > > > > > > On 8/13/2026 6:58 AM, Edgecombe, Rick P wrote:
> > > > 
> > > > ...
> > > > 
> > > > > > The more I look at this, the more I'm against shoving garbage into vt->exit_reasons.
> > > > > > With tdx_is_exit_reason_valid(), this is trivially easy to handle, *and* explicitly
> > > > > > captures the logic instead of subtly rerouting KVM away from meaningful handling.
> > > > > 
> > > > > tdx_is_exit_reason_valid() doesn't work unless we update the vp_enter_ret to
> > > > > one that isn't one of the status code with valid Exit Reason. See below.
> > > > 
> > > > Correct.
> > > > 
> > > > > About the idea, isn't the purpose of setting the Exit Reason to a synthesized
> > > > > one is to avoid the undefined Exit Reason causing false-positives when it
> > > > > happens to match one of the existing ones?
> > > > 
> > > > Yes.  The nuance is that I'm against clobbering the *full* exit reason.  I am
> > > > not against setting exit_reason.basic to something like EXIT_REASON_INVALID_STATE.
> > > 
> > > I'm not sure why you are not OK with setting the bit[31:16] to 0 ...
> > 
> > I'm all for that.  I'm against setting them to 1, which is what using -1u does.
> > 
> > Ah, I'm guessing my use of "clobbering" is confusing.  I was mentally viewing
> > setting them to '1' as clobbering, versus setting them to '0' as "doing the right
> > thing.
> > 
> > E.g. the VM-Exit (that didn't happen) wasn't due to a failed guest consistency
> > check; it certainly wasn't an SMI from VMX Root, nor was an MTF pending at the
> > time of the SMI that didn't happen; the guest wasn't in enclave mode; there was
> > no concident bus lock; all other bits are reserved to zero.
> > 
> > Sorry, I should have clarified that writing the full exit reason is ok, but setting
> > arbitrary bits in a way that isn't consistent with reality is not.
> 
> I will add a separate patch in the next version to set
> 
>   vt->exit_reasons.full = TDX_INVALID_EXIT_REASON;
> 
> where TDX_INVALID_EXIT_REASON is U16_MAX, i.e. 0x0000FFFF.

I would rather do:

	vt->exit_reason.full = 0;
	vt->exit_reason.basic = ???;

So that it's abundantly clear that bits 31:16 hold *valid* state, i.e. to make it
more obvious that the value shoved into the basic exit reason is arbitrary, whereas
clearing bits 31:16 is not.
