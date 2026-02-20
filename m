Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E51E366041
	for <linux-coco@lists.linux.dev>; Fri, 20 Feb 2026 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771608980; cv=none; b=Yr3n/DoBDfaaYwfOkVf9n7W+QacE0KjMBjS9rcLeePN2/wH6oFSjuvOlgfp8cI+ykPaY+0ZonszZ7oVGAq0YWSeSN5LCd5LvBErb4U+z0xSnVKvR2HPT7aRU0mIJHZkITK3UnfvC0HtMVUUTE1Tejtlat/awYmcO09hmuqm/n+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771608980; c=relaxed/simple;
	bh=hk7yXmM1aV9/FRe2EJXMXYJoy7A43ImHdOcEk/9ZdFM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VFKOIF7ZTsSOyyttB9Akig22NdJ4hLoymQfzqWVQMIRvnnE5wH1C3QWLsV33xAHUCbxOJRrtBdPMXvo2YhDs8SrfzJTZp3Nm61c4NPJZm0MSJlavse8g+WrsJJCOHYXuUi+ZEnlaKVWwLr6MVOg2eqEU72wip4LDAL2jkJOG8Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NYhwrM7+; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NYhwrM7+"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c6e1d074b26so1386579a12.3
        for <linux-coco@lists.linux.dev>; Fri, 20 Feb 2026 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771608978; x=1772213778; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hk7yXmM1aV9/FRe2EJXMXYJoy7A43ImHdOcEk/9ZdFM=;
        b=NYhwrM7+Zjw0Oc4LMZEzswcxzGZpgo659Fokig8a7UzwfUMcemkUIehFtGJj5CH3TZ
         wj1I9tlkh2FiXMPqSELhCJUYSQExaGp6T9W8gDtTQfKixj1TXsah7rUMbzjbXVcjqajZ
         Vd5jkY5kTI6d4fDKvGTARrBJW85V2Z8+pshxnMENpBvdbL3p/la2sC8t1UCQ/Ia9On4o
         4l9YGkgUDFX7cpyWWKU/fOYK4PVLz1IoCFDC/7YPFU1FGiYUoyZ31uY6+HCWVnEuSQeR
         X1tsXhIM+kiV43V2V+cgjscYFb+p/gRpMxC+TgxvB/GKI6FQqirZ9rhC34VAdh9NHLhZ
         Ou2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771608978; x=1772213778;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hk7yXmM1aV9/FRe2EJXMXYJoy7A43ImHdOcEk/9ZdFM=;
        b=rpiPw15ZgENbu3GLD5iS5Qk+TYfOPgpqu1WO/qMfE0t+g0HO3fn97OZdhWHY24BoEq
         X196+qAtTHXLkTIeroj2/M1mD6T0e6YSzapnm8xwl+AdiF/Ase/HoKJPxGxhbZk5o+dP
         +si5IBDQKebQO8EH/rckxFqYKHZLmJNzC7HHzWgnMz/5M/qAXz7gFjSAfP16b5bfSCkK
         Aaqheeouu71yr61UETCXSKuxTU0h5hM4Roo3Eh6dO707mm8Z2D8EDxS1WJ1pQsl034rh
         VphADxPaCd4Fgugo5jYhMz7+3n0aIibteadJui2ZgVSCtb2kJgeEdCfHJxVm+2kbkumt
         eAjA==
X-Forwarded-Encrypted: i=1; AJvYcCV+dk3lnLKwE00KuSb5o1RboRPK9PtjF+aBMPzIkY09Sjjf0VOBlhxRLk5uKZxu41JISmm9wNPifPSZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4za5bZpevtJ7S7EMq90hD97pWuxJzR/WT8nCS/QLs0W2A9Lqg
	DbzIUazqs+JbdBcnnEd/i3OFczarreOOtPJIO+p0GWOgVPZvzqb6Zr9Ym/MwA0qrCShw3HCYzsF
	kyELHjw==
X-Received: from pgbz2.prod.google.com ([2002:a63:6502:0:b0:c6e:4b29:e099])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e095:b0:366:14ac:8c6f
 with SMTP id adf61e73a8af0-39545fe80e9mr288982637.69.1771608978196; Fri, 20
 Feb 2026 09:36:18 -0800 (PST)
Date: Fri, 20 Feb 2026 09:36:16 -0800
In-Reply-To: <75fc3f45e24309abef6dae31809012440de6d4ee.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-6-seanjc@google.com>
 <aYHLlTPeo2fzh02y@yzhao56-desk.sh.intel.com> <aYJU8Som706YkIEO@google.com> <75fc3f45e24309abef6dae31809012440de6d4ee.camel@intel.com>
Message-ID: <aZibkNNI2Xu5oMTf@google.com>
Subject: Re: [RFC PATCH v5 05/45] KVM: TDX: Drop kvm_x86_ops.link_external_spt(),
 use .set_external_spte() for all
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Yan Y Zhao <yan.y.zhao@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Kai Huang <kai.huang@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "ackerleytng@google.com" <ackerleytng@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"sagis@google.com" <sagis@google.com>, "tglx@kernel.org" <tglx@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	Vishal Annapurve <vannapurve@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026, Rick P Edgecombe wrote:
> On Tue, 2026-02-03 at 20:05 +0000, Sean Christopherson wrote:
> > > And mirror_spte --> new_spte?
> >=20
> > Hmm, ya, I made that change later, but it can probably be shifted here.
>=20
> Sorry for the late comment on the tiny detail, but things seemed to have =
calmed
> down enough to attempt to merge these discussions into the snarl.
>=20
> It doesn't quite fit in this patch=C2=A0because the set_external_spte() o=
p also uses
> the mirror_pte name. So then you need to either expand the scope of the p=
atch to
> change "mirror" to "new" across the callchain, or creating a small mismat=
ch
> between tdx_sept_set_private_spte() and tdx_sept_link_private_spt().
>=20
> The patch where it happens in this series needs to add the old_pte, forci=
ng
> mirror_spte to grow some new nomenclature. So on balance I think it fits =
better
> there, and we should leave it alone here. We can update it in
> tdx_sept_link_private_spt() in "KVM: x86/mmu: Plumb the old_spte into
> kvm_x86_ops.set_external_spte()".

No argument from me.
