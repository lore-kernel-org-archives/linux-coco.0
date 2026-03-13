Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD80247295
	for <linux-coco@lists.linux.dev>; Fri, 13 Mar 2026 00:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362327; cv=none; b=Eim3LR2931GBUEKHfA1am2Zc8bOte2M6K0nv8KbUVFGPTzg8ASOQDzCQROnsnmUW9Tw9WZvZXpo6zdxCM0yEXAGm54xytUZkVEeN0kfDjqWGQVZJcOIvGedxRqRNMvUCY0H8k9fbT5HpIjabwRBNvA3rHub0SDtE6FtNWklxdio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362327; c=relaxed/simple;
	bh=zCHDmUwlHgNjSHNh0xcE8X4h9oqkDg/q3tMYn+q9vXc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lNtqSla8Sx2lV5+3X+t+r0wHrCw8AfmHFLE48S+9PmByOx+Hx6RzD3t4qSKVLwph2MiyG/wOr754y16AMynYE1BOQHOWUviWzLDxWLpSOepk3zrv13eliZW6LtdCM8poSYZ2CeTkIOIKTMxhYhd7g8BgyKt4x7sADgpswjQ0SEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lA2qlfov; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lA2qlfov"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c73c065dd15so794001a12.0
        for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 17:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773362326; x=1773967126; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BrA9+DazdYkJgNz+zHsE+a3JealnAO/XZn/zqlAAy5I=;
        b=lA2qlfov9kZjYYmmOiHBOBpt5TmG8lp8Bzg98m1NVkcKRE5hhLPZm9FlUbmSf9XoeN
         /1DkzopLY0eAvBhI2OHweGu6fv4b0NTVOC0q8RjB0HIzSOhNBEDYnibufhC8o5YNN7Te
         rYsXnAZlEpBy+ErsaTgAn9Zytu9EK+syTmfnDJZI+WQzbTtjP74nL/Xfe3FX3QB2p5ee
         U8flnlcvS1+bCgFZPHMRREp9D9SrL8ObIdzeybqYf1W0ffDSYi3YtPlY78aSC1RbB3VT
         /f2tqO8HD+YJbhYgxIabBfXbPor3HKemzKzAcVc6AeyW0mTpONfKvcosnbyRzLkUW5n7
         rPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773362326; x=1773967126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BrA9+DazdYkJgNz+zHsE+a3JealnAO/XZn/zqlAAy5I=;
        b=rSvPfBLNi2a2wHQjPqg9c29Z0joC8EY4IXHPvC9m2UYE+lZw9Q5HEn7qG1qF+eTSZY
         m4eVnGeTCCycQFQmA+pflFaGTZFesnVQ2E2wGBxcD9QnInltl/D7Az678eKi9rExJTt/
         wsNICMV/pu7xb1yEvAgckUti60RsFXXyEcVmdqdVV0qL5Up03v1/CX3XvSx4lPkpGYRx
         g2EHMuxFCPUL0jPE9afA0UlD5mYisSTKMD2Peit4/08QkAbDrBX+ghTjgzZ9VG2mgfAE
         kUgIwRFaTE2mcw88H4Xci3hzAU7jhaOPd2X69vyYwx+s2dkv2x2piAakVDQeF6XajVq6
         ieDg==
X-Forwarded-Encrypted: i=1; AJvYcCVjENGUlQ8fTADSEfbyTkvunB1KnIIo7U06fe/5cD1lDHTX2VTbbAW+k9+zZS7LDL9AgiKTN4w8vM9Q@lists.linux.dev
X-Gm-Message-State: AOJu0YxPMBIgwMUV6U0dAdGTBeGgXsVfzraglpPxDyx79eBCGWe1inSL
	WdakLB37NYc0gpAGkpvPQcn1XmLlhZTkDYT2SO9QEW6iJVA+xuYO6D/y/4ASFchjSeZPY+m8+AM
	kng77Ew==
X-Received: from pgww18.prod.google.com ([2002:a05:6a02:2c92:b0:c73:7789:143c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:134b:b0:398:7853:dd8b
 with SMTP id adf61e73a8af0-398eca32beemr950504637.9.1773362325740; Thu, 12
 Mar 2026 17:38:45 -0700 (PDT)
Date: Thu, 12 Mar 2026 17:38:44 -0700
In-Reply-To: <c117141f-61da-4572-98ea-7a8a79eb5bab@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com> <20260311003346.2626238-5-seanjc@google.com>
 <CAO9r8zNBEOJrxbx8ob2KRLRKkd_aZjz8tyXGqXxs0=TJq4fU6Q@mail.gmail.com>
 <abFulxXuRziXj039@google.com> <c117141f-61da-4572-98ea-7a8a79eb5bab@redhat.com>
Message-ID: <abNclCT09InLIP-M@google.com>
Subject: Re: [PATCH 4/7] KVM: x86: Add wrapper APIs to reset dirty/available
 register masks
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, kvm@vger.kernel.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Mar 11, 2026, Paolo Bonzini wrote:
> On 3/11/26 14:31, Sean Christopherson wrote:
> > > Not closely following this series and don't know this code well, but
> > > this API is very confusing for me tbh. Especially in comparison with
> > > kvm_reset_dirty_registers().
> > > 
> > > Maybe rename this to kvm_clear_available_registers(), and pass in a
> > > "clear_mask", then reverse the polarity:
> > > 
> > > vcpu->arch.regs_avail &= ~clear_mask;
> > Oh, yeah, I can do something like that.  I originally misread the TDX code and
> > thought it was explicitly setting regs_avail, and so came up with a roundabout
> > name.  I didn't revisit the naming or the polarity of the param once I realized
> > all callers could use the same scheme.
> > 
> > No small part of me is tempted to turn it into a straigh "set" though, unless I'm
> > missing something, the whole &= business is an implementation quirk.
> 
> I like kvm_clear_available_registers() for this + removing the second
> argument completely for kvm_reset_dirty_registers().

Ya, me too.  I almost dropped the param for kvm_reset_dirty_registers(), but
wanted symmetry since the names were the same.  But I like this a lot more.
