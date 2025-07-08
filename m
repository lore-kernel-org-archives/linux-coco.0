Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48F2DEA78
	for <linux-coco@lists.linux.dev>; Tue,  8 Jul 2025 14:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751985868; cv=none; b=T/BftbBmykN0GYzq5V4+rTikfUOMxfHbB/VBfhf4Z2gTJQiha4o+mvn/PveY/OUlsn/LiU2Am9k+Sn7V5YzVL8ooCZa3rsDpyLsTriyuxgGEauEq7dmQOMxDxv8Tl1fDSKFgM0wJJwOi0QP9lULVg9Yb39SGWY9f6NqLaUUow48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751985868; c=relaxed/simple;
	bh=TXEGRBsgm+n8P+t42R28we4U8CCik0hjXIM15uylAJU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NJT5870Qw869fMo1llIrxB9cNDbLzGVOTFqovTpqpJMp9/lGTJISjjplvSbmkMUS8XxeBHJV4g+MYZpKqeWJ6vVrvVpQJGLkXj6GGAOpQA86YWY+Dk4vx8DgiydNQGZ/ALbc0SVQ/K6s3kYG7sC4vbR58uEIU3FvGY+L8tSJUbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mpR9+RQO; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mpR9+RQO"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748e1e474f8so6816516b3a.2
        for <linux-coco@lists.linux.dev>; Tue, 08 Jul 2025 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751985866; x=1752590666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4Y0LHIYImOnqvxWJNSqr5NHEbLMZdgrbi8mWqVwvxE=;
        b=mpR9+RQOxiw0c0zahkEiZgdlIFo3yNgqxkHXjhHPyzMdAt+cRUVEygTPsJQlF+XVf6
         V4f+9Gxreev+kP2z3VfVAlq9/Woa0sR80SadiacLM36s2GtUENOLUtXngjAhothdGevQ
         R+LRvrsh1vUBH5VFFLq2t6ylVAFH7SOo9XXC+3kJRJXc8z1HugRmdPPVyaNJofJ0zPKq
         BXU+qWkoA9aqitp76CjSWjl47hxFsxBCoxULr7nwNvvZIs4C3CGDrgKz8Rc0L6fgb++s
         uq3fWtxJ6d8JGBPoPy32SbrxZWUPp43g8+lU2DXpeQG0/+18GRFRrR4AKGpITPmabMJd
         qDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985866; x=1752590666;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M4Y0LHIYImOnqvxWJNSqr5NHEbLMZdgrbi8mWqVwvxE=;
        b=X/jAu6URKcE33w6fIuCLVW3p+ltM2ye2ouaiDKb0nj2nb4aig8MUuwlxXkS22/otXK
         92zXRLZzty9SyOwcZCLJnC3FY9w7q1vEB5ORqRL7IcUoXfJuG0IT8NqZw360dSRhwU3C
         J21okOYzpS3k92hBDeb6MuUZb06Szbjfd7ycoq+9LoPoJI4nAGsaYxvCPX0vvA+8HnSy
         V8ISlyP/Jqnb/DeM6L8TYqvSn+J+FS9LXrZZSLHKwfPaViW+pzfzbqcv1En1TCeVwi4M
         AYJ1qz+uSgMYwaXxKRbIb8GIsxUtPbeBLgpbBusafxKTr0Ci2NFigS9gvwSJGn3f3I4L
         8ehA==
X-Forwarded-Encrypted: i=1; AJvYcCXMvDN6gfQ3rTIZGcEkltAtKGp4gR8kAFnk4LuY7GzKUL8bwQqyJsFjGuPmjMSh6sUo6dXy1eBoc3hg@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3Yi23VID9ImQ/IxyBgrjaVc4favSXn2ksai46IK4FZZDqOgDO
	9tVhnKaqfp8IigG1nvXCeg3JIfGfyRXNcOv41QIVL1LfVwvshftXlX1xhyhZ+bENzdy9jj8wmBk
	msvl9sA==
X-Google-Smtp-Source: AGHT+IEryFAJQIP1RYdnl3B5+MmSaaqt34bQLLxukJow6DGBXYKU32xvLqLVHhWhYnnjS3IC2/q6uMASVdg=
X-Received: from pfus6.prod.google.com ([2002:a05:6a00:8c6:b0:747:9faf:ed39])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:80c:b0:736:5664:53f3
 with SMTP id d2e1a72fcca58-74ce6668f9cmr23430472b3a.15.1751985866098; Tue, 08
 Jul 2025 07:44:26 -0700 (PDT)
Date: Tue, 8 Jul 2025 07:44:24 -0700
In-Reply-To: <bdd84a04818a40dd1c7f94bb7d47c4a0116d5e5d.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250708080314.43081-1-xiaoyao.li@intel.com> <20250708080314.43081-3-xiaoyao.li@intel.com>
 <aG0lK5MiufiTCi9x@google.com> <bdd84a04818a40dd1c7f94bb7d47c4a0116d5e5d.camel@intel.com>
Message-ID: <aG0uyLwxqfKSX72s@google.com>
Subject: Re: [PATCH 2/2] KVM: TDX: Remove redundant definitions of TDX_TD_ATTR_*
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Reinette Chatre <reinette.chatre@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"hpa@zytor.com" <hpa@zytor.com>, Tony Lindgren <tony.lindgren@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2025, Rick P Edgecombe wrote:
> On Tue, 2025-07-08 at 07:03 -0700, Sean Christopherson wrote:
> > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > > index c539c2e6109f..efb7d589b672 100644
> > > --- a/arch/x86/kvm/vmx/tdx.c
> > > +++ b/arch/x86/kvm/vmx/tdx.c
> > > @@ -62,7 +62,7 @@ void tdh_vp_wr_failed(struct vcpu_tdx *tdx, char *u=
class,
> > > char *op, u32 field,
> > > =C2=A0=C2=A0	pr_err("TDH_VP_WR[%s.0x%x]%s0x%llx failed: 0x%llx\n", uc=
lass,
> > > field, op, val, err);
> > > =C2=A0 }
> > > =C2=A0=20
> > > -#define KVM_SUPPORTED_TD_ATTRS (TDX_TD_ATTR_SEPT_VE_DISABLE)
> > > +#define KVM_SUPPORTED_TD_ATTRS (TDX_ATTR_SEPT_VE_DISABLE)
> >=20
> > Would it make sense to rename KVM_SUPPORTED_TD_ATTRS to
> > KVM_SUPPORTED_TDX_ATTRS?
> > The names from common code lack the TD qualifier, and I think it'd be h=
elpful
> > for
> > readers to have have TDX in the name (even though I agree "TD" is more
> > precise).
>=20
> It's useful to know that these are per-TD attributes and not per-TDX modu=
le.
> Especially for TDX_TD_ATTR_DEBUG. I kind of prefer the KVM naming scheme =
that is
> removed in this patch.

Heh, as does Xiaoyao, and me too.  I thought I was just being nitpicky :-)

Though in that case, I think I'd prefer KVM_SUPPORTED_TDX_TD_ATTRS.

