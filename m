Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D1B2E1F06
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235869; cv=none; b=tX5MnfAHZbFR1+/NILa9U0mhmv4bUw3smwK+Xu3IAnd6B8J5FWfHA+HLNTft1h3QIIGCv4aYwndjRaCWRth1bqpbHUK0AUZr+CkZ+0+UYR99C5RGIfL43g+5m+0bDfY3ig0TgvRJltCQyesqgBmvVu91t/KbLT5Seg4+bTTFy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235869; c=relaxed/simple;
	bh=/ZCHNQR0K/KHtlF/tI4c3P2/31qh0EwZ5OC2MqCjQzo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EnH3KS2cNZmvpXxC1PvNu8ZmFL3uJtbWfGY9kr3pGmvRAzPn1Kd5J86at2vnWLfhzA/gTO896kqgifXX5sPQJipfzPrdG14ovBPTNPUEvu903ZpTOdrf4lX/nXBmFL26CoDYmZF6sCg1arrNBjfV1C2xrdrKnGoWdFPO0rL/JHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WiEV5gDO; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WiEV5gDO"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c738662b963so4564453a12.0
        for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773235866; x=1773840666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZLhg+7nDQkz8+/rpm0J7Hm6SsaOjD5Jd9IV860eNcY=;
        b=WiEV5gDOEcsljmAcCN80OFSRBheU6TcBoPiF/xijYn3tdrb2NcHuvTrc0UtlX4AlpK
         pxG6TezzRE+7mkBQYciOZNBc+CbnDbmGgg1S743IV/VFMtMxO/OcO5RW68ifANT6lEqJ
         6V7ija+TAVRVbDAVmNO0GzBUqkVPAS3b3kbgrzLsTp0HJN5ooixSLqdIciS1Kghp3ObN
         5SZCQQR1IfJBilh9+8BMdow1OYmZE8YWsbKV2zh6efw+gVodQTl94j1xJW15jRnXQCpF
         s/MZxgUt/5HlBRUqPyfCEd7CXRsNNJzypJ6N4ZYgaxOcqN56N7vLSI2Q3fRKeoc3dVlv
         OVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235866; x=1773840666;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GZLhg+7nDQkz8+/rpm0J7Hm6SsaOjD5Jd9IV860eNcY=;
        b=Wn0wWm5eGsX/sQnMdOHdW2hRwnXeu147bszXHve3CTrm+ggCOvg78BeqmlQHzhhS2i
         l4/NgYGEZDxH9WmWDdlhyo106W//c3Ti15PKnMBqJr46+8O3pu5iHj+lQ3+cY3MQf0AR
         07Dk5b074bCiot5M+15ubLJ7n5+1AQ/opupNKwW7B61SKQyuJUw/CniqFqFO1BgRyT+/
         xUNn6A3EHPpPLPhiW+gw7PaCTtVHvCzU1rUnDLv8MDJbtllYVu8YlJXnUUlVlgpmQ9bv
         JLwoLxUsSeCw4mtH+37pdzxpVdzHtKtFx5tQHS8ecvRtmwTbY0HmU9kn+6k/7dyzUSIv
         T83w==
X-Forwarded-Encrypted: i=1; AJvYcCUXjxZdOigApWZ1T49NrYl31DfHH0xnjhUreymip4RCrnO+aJfKNoEccvKtCADtBiO1BnrZKgzmkaD4@lists.linux.dev
X-Gm-Message-State: AOJu0YyHAnIOTLXq8H6KK7oCs8bBiLe37k2bXhhEdwPKB/WfX8foThpH
	zzrtmb+QTKtpmhKUxJ1pW1QmhpwLTPHbPf6u62Mw4VXfn+N6n5SJmAiB8n6kjv/UgGznKd2cgv2
	HvQx5qQ==
X-Received: from pgjc17.prod.google.com ([2002:a63:d151:0:b0:c70:ab5b:1db6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a94:b0:398:9bb1:ad07
 with SMTP id adf61e73a8af0-398c5f3d48cmr2534716637.22.1773235865707; Wed, 11
 Mar 2026 06:31:05 -0700 (PDT)
Date: Wed, 11 Mar 2026 06:31:03 -0700
In-Reply-To: <CAO9r8zNBEOJrxbx8ob2KRLRKkd_aZjz8tyXGqXxs0=TJq4fU6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com> <20260311003346.2626238-5-seanjc@google.com>
 <CAO9r8zNBEOJrxbx8ob2KRLRKkd_aZjz8tyXGqXxs0=TJq4fU6Q@mail.gmail.com>
Message-ID: <abFulxXuRziXj039@google.com>
Subject: Re: [PATCH 4/7] KVM: x86: Add wrapper APIs to reset dirty/available
 register masks
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, kvm@vger.kernel.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Chang S . Bae" <chang.seok.bae@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026, Yosry Ahmed wrote:
> On Tue, Mar 10, 2026 at 5:34=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > Add wrappers for setting regs_{avail,dirty} in anticipation of turning =
the
> > fields into proper bitmaps, at which point direct writes won't work so
> > well.
> >
> > Deliberately leave the initialization in kvm_arch_vcpu_create() as-is,
> > because the regs_avail logic in particular is special in that it's the =
one
> > and only place where KVM marks eagerly synchronized registers as availa=
ble.
> >
> > No functional change intended.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/kvm_cache_regs.h | 19 +++++++++++++++++++
> >  arch/x86/kvm/svm/svm.c        |  4 ++--
> >  arch/x86/kvm/vmx/nested.c     |  4 ++--
> >  arch/x86/kvm/vmx/tdx.c        |  2 +-
> >  arch/x86/kvm/vmx/vmx.c        |  4 ++--
> >  5 files changed, 26 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_reg=
s.h
> > index ac1f9867a234..94e31cf38cb8 100644
> > --- a/arch/x86/kvm/kvm_cache_regs.h
> > +++ b/arch/x86/kvm/kvm_cache_regs.h
> > @@ -105,6 +105,25 @@ static __always_inline bool kvm_register_test_and_=
mark_available(struct kvm_vcpu
> >         return arch___test_and_set_bit(reg, (unsigned long *)&vcpu->arc=
h.regs_avail);
> >  }
> >
> > +static __always_inline void kvm_reset_available_registers(struct kvm_v=
cpu *vcpu,
> > +                                                         u32 available=
_mask)
>=20
> Not closely following this series and don't know this code well, but
> this API is very confusing for me tbh. Especially in comparison with
> kvm_reset_dirty_registers().
>=20
> Maybe rename this to kvm_clear_available_registers(), and pass in a
> "clear_mask", then reverse the polarity:
>=20
> vcpu->arch.regs_avail &=3D ~clear_mask;

Oh, yeah, I can do something like that.  I originally misread the TDX code =
and
thought it was explicitly setting regs_avail, and so came up with a roundab=
out
name.  I didn't revisit the naming or the polarity of the param once I real=
ized
all callers could use the same scheme.

No small part of me is tempted to turn it into a straigh "set" though, unle=
ss I'm
missing something, the whole &=3D business is an implementation quirk.

> Most callers are already passing in an inverse of a mask, so might as
> well pass the mask as-is and invert it here, and it helps make the
> name clear, we're passing in a bitmask to clear from regs_avail.
