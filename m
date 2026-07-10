Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBD64192EC
	for <linux-coco@lists.linux.dev>; Fri, 10 Jul 2026 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694885; cv=none; b=F302EKhT6cdo3XkLyCJ4/BQWFGO/wQ2EgVGdYKrqTE6RofWmi/utWdB/uFnPL715LoHFUgFCs7WrEqItrKY5kbcGjgwY/ZA9pNyGHY4/DJ1hgPRZmc3+I+CSttB0KJohoqGCijQALL+4wOL8wm7nw/KzDQaxUCwP1BMV2nbMja4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694885; c=relaxed/simple;
	bh=9/BUljy6TNRY9n09ZmVql69eTpV3ZFcHR2xOX8xQaBc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GSrLB/Orv47mXG6i0ltuUngiUEf2HyiVeSXLTSBPLUvBtXHKp41I/jINS34xU6NoRcynLog7nu8s9ilww3Iwzvi1PwKndem9zdw6siSelKKqRWEN0yXRrcRvFxpOrXYv2+VdklFsAeGoL6/w0vd3szzYUtEAcoZsAijJCiyoo0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AxkQeJWw; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AxkQeJWw"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so2071176a12.2
        for <linux-coco@lists.linux.dev>; Fri, 10 Jul 2026 07:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783694884; x=1784299684; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMyY/scxQTo0tXtbyEdWPI4W0NbSwCug6oGYu+Luc9M=;
        b=AxkQeJWwRf6oRhS0ghmhZEoRGV4ENgTq+FaLJi+hcNJ6F3q3II1M7CrfpLYxvLDBjW
         8GsFYiIPuALNdzyJ5aayXbAEDJqJo+u0rDMW6EkEnBH1d8zWTdBoZ2NPPf7IiN1XKxTM
         iw8nhxyX3/DioMOV+kALdZlWUrMFSePKE6cZOfxk1ngKqvIcRRcGhQoUybV0yqCzMlGm
         qMSW0JCyuDQeefS1fywLJCld90W/4dxWyjJUgpNsOp7rHBKHJFSVEk/sD/a9pN2/ZZZt
         cUEvDKDBIHnOvbZJvqFY0/BSM9jxRrWRdH2emVUz5aSUwKp0U9xoflHAfZNWHUJ5LVRy
         pHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783694884; x=1784299684;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMyY/scxQTo0tXtbyEdWPI4W0NbSwCug6oGYu+Luc9M=;
        b=aSGUGQzTkiIgNMGWl2FdJ3iVoGXGvd7tswmu3inFzzb66fLED+jH7+W/k2hP08Tcf/
         DjPxI4XR2vrxzPcRWjitJoH6hwNCf4jxfnWzyIewecGB3ueJEVTVICTzT+5aCx4o5q1g
         oxBuHgJaUHDZPuXr7dMnHb0QsgY+DDZOdhz1ex/GXuiK4wC3yV2nc1EQGIvaJlsO0uYj
         jgq/c0o0XQeXgc5QExKOr9VcaZVl4C5/s4bcCybAiIZv+UO+HejJLIu1bWIC6SWlcHLR
         /wrpaH7ExNRxUj1gGSH8WcCpMDqyNiBaAAGgUj/0wylWhZe6RLF9xiWrQYiN2bCMv0TA
         Fj1A==
X-Forwarded-Encrypted: i=1; AHgh+RoPp4MdlPs/i2tX8DUA6pgVj5e6PojmqcsZNVvmTJQzWz38Px/MCy5b2WEzDagMxW+EGKxQ2PRT+8bL@lists.linux.dev
X-Gm-Message-State: AOJu0YyX3w/BJfrB3HbF8c4Yszy+hpQWSq2zp7Qt1ymWXJam1LOC9M68
	4az6PqGmiVLB8b2NM0XmwK082AEcij11WVAmbjj3oVfGdgdF0zyIx9F7irs3eG+UclcMBiGNyVq
	YnGmPvw==
X-Received: from pghi22.prod.google.com ([2002:a63:e916:0:b0:c99:7baf:126d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:32a2:b0:3bf:a0e5:99a5
 with SMTP id adf61e73a8af0-3c0bcea2f0cmr16321169637.47.1783694883588; Fri, 10
 Jul 2026 07:48:03 -0700 (PDT)
Date: Fri, 10 Jul 2026 07:48:02 -0700
In-Reply-To: <20260710125211.GB2816371@pedri>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618081355.3253581-1-yilun.xu@linux.intel.com>
 <20260618081355.3253581-17-yilun.xu@linux.intel.com> <ak7DMwbF4viiVoO5@google.com>
 <20260710125211.GB2816371@pedri>
Message-ID: <alEGIrWhQvzf2wAV@google.com>
Subject: Re: [PATCH v2 16/17] KVM: TDX: Add in-kernel Quote generation
From: Sean Christopherson <seanjc@google.com>
To: Peter Fang <peter.fang@intel.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, djbw@kernel.org, 
	kas@kernel.org, rick.p.edgecombe@intel.com, yilun.xu@intel.com, 
	xiaoyao.li@intel.com, sohil.mehta@intel.com, adrian.hunter@intel.com, 
	kishen.maloor@intel.com, tony.lindgren@linux.intel.com, 
	baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, dave.hansen@intel.com, 
	dave.hansen@linux.intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 10, 2026, Peter Fang wrote:
> On Wed, Jul 08, 2026 at 02:37:55PM -0700, Sean Christopherson wrote:
> > On Thu, Jun 18, 2026, Xu Yilun wrote:
> > And is keying off tdx_quote_enabled() and only tdx_quote_enabled() backwards
> > compatible?  How do we know that cutting userspace out of the loop wont' break
> > anything?
> 
> Yeah this needs explaining:
> 
> The guest-observable difference between the two paths is that it sees
> quotes in different formats (the TDX module uses newer formats of
> course). And an old guest must be able to continue using its
> TDVMCALL<GetQuote> interface for quotes. The guest sends the quote to an
> external verifier to authenticate itself. The verifier (part of the
> cloud infrastructure) must know how to parse this format. So in other
> words, it's the verifier that must maintain backward compatibility if it
> wants to continue accepting old quotes. And it needs to be updated to
> support newer formats as well.

Uh, no, that's not how KVM's guest/host ABI works.  Updating the host kernel and
breaking existing guest is not acceptable.

> > > +{
> > > +	gfn_t gfn_start, gfn_end;
> > > +	u64 end;
> > > +
> > > +	if (!size)
> > > +		return TDVMCALL_STATUS_INVALID_OPERAND;
> > > +
> > > +	if (!PAGE_ALIGNED(gpa) || !PAGE_ALIGNED(size))
> > > +		return TDVMCALL_STATUS_ALIGN_ERROR;
> > > +
> > > +	if (check_add_overflow(gpa, size, &end))
> > > +		return TDVMCALL_STATUS_INVALID_OPERAND;
> > > +
> > > +	gfn_start = gpa_to_gfn(gpa);
> > > +	gfn_end = gpa_to_gfn(end);
> > > +
> > > +	/*
> > > +	 * Reject if the guest didn't explicitly convert its quote pages to
> > > +	 * shared.
> > > +	 */
> > > +	if (!kvm_range_has_memory_attributes(vcpu->kvm, gfn_start, gfn_end,
> > > +					     KVM_MEMORY_ATTRIBUTE_PRIVATE, 0))
> > 
> > TOCTOU?
> 
> I struggled a bit with this actually... I can't just grab
> kvm->slots_lock here, and dropping kvm->srcu seems bad because the quote
> will be written to guest memory later. I settled on the idea that the
> guest should make sure these pages are converted to shared first. If it
> tries to convert them back to private after this check, before this
> TDVMCALL returns, then it's kind of a self-inflicted race and I don't
> see KVM doing any self damage in this case. Not sure if this makes sense
> to you? Or maybe I should just drop this check and go straight to
> kvm_vcpu_read_guest()?

Yes, drop it and rely on uaccess to do the right thing.
