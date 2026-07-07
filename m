Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621693E5A01
	for <linux-coco@lists.linux.dev>; Tue,  7 Jul 2026 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441057; cv=none; b=e9KBloUC1WO0pGF3ISkcuvBeZVaqpjvWOGjQUid6pcO/l5+3m2CltJd2mSqa0m/iHmv9KOEabxsiH0m7pKfSitiDCo2qIkDpPcbGW113Sfty3IBlAcpmRm4TGeD+bj8ZrlscEKQ+qj6s5ZASYKbYgV7mTdHyxXjA83bJTrhmidQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441057; c=relaxed/simple;
	bh=Al6q5hSzbakCy6OHe7OE0sutONb/Jedtd8RaoFJGZSw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ck1glOtUdPr6p7lZaIO4YT/WLf/U7mnfJCU5zaLyiHtFoHdG8V/GMkykmBoAKsVNiCgtqRdXoULhuQVEdVmxc0ijXzDzzQ/GOzqeDAVBC9eE/hLuyYsmPjsnSvzGkHOL+Le19sA+rsEZQ00i+D9ikeuRGkRadLlmeDdsRKWS50w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EPmHtH23; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EPmHtH23"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c98136ceff4so7728890a12.2
        for <linux-coco@lists.linux.dev>; Tue, 07 Jul 2026 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783441054; x=1784045854; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Al6q5hSzbakCy6OHe7OE0sutONb/Jedtd8RaoFJGZSw=;
        b=EPmHtH23FGEqbzHegATHkjFCmEGfZSy2vEIOm3WKB+UAVQ0oXCKZhxSad3EY2+/YHv
         RM+DkSQgcWPJmA7ONyx5RCyI/LFFi9oUzrkrXgj2DHknMIY3JlWdh8my7Jdpputyhehf
         ZMbCruF06FIEHf6yQFBfjerB1E8m8RAGNr2Es6JJXuo5RII1jExICgu8fPIsmcvzMLMT
         dlD2Zuv83i0/EwjZHYrhwmK73mbhP9VELjWEVBZnwbzOIrfdNpFxAi8BjJJ562j4vXWR
         Rma/AKvUMfqxtXksnDmf71MTLNORv+4CS3Lkbf9FBST98n/si8KUzTY/fYtp/SSqsoeV
         qejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783441054; x=1784045854;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Al6q5hSzbakCy6OHe7OE0sutONb/Jedtd8RaoFJGZSw=;
        b=qsrrWJ8VCLYcfH5Kdmk+IQ1n1hau2OOAjsz4JXNUhDAITbBG3kflmD3Uy62BhT8Mbp
         WVtF1JespbPIL4X3uR+TIlh2arTF61xxC6fUb1wk4psZgcsZ0lVRAwUkS2ITetiz5bhx
         IqpiYDo3dGmSfxQgfheYuuIXZ4Q2MZ5gzZPwOb4wUQnXu876iK04jk+y7Jg690wrheiB
         IPHVnjZL6S2YI8JLi7XAy+4d4SFtnx4pBtTzYktLiVcWFqw7xJFMhCS4aAgv2LvgK6sI
         /6OORxxvDgFo83at8vlY52Xgk/+eFPKL02WuX03730bfsFbetvf/mE7f9j666TtwYibw
         G+lQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrczrzo9T4+wqlTcc3YSFWhsM8by2WuEPTG3kyfpl//XEaT1iCh4ibXwN0Rm/yDzLBb3gzK/kIGUK+h@lists.linux.dev
X-Gm-Message-State: AOJu0YxKxz0+bJyl6XHgTKHXG4kMSPjuTSU8WQJazBewP8aUVXWI4B+6
	6mMwDK4qPlW3FLpz/8y+QloI+2xtSkIzQYn8/36QRWtiIjnn7exXnCdmFOplTH/8nUQ2rQUvPHc
	Q3tKNeA==
X-Received: from pgam21.prod.google.com ([2002:a05:6a02:2b55:b0:c99:d21a:f6b1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c786:b0:3b3:be05:2b73
 with SMTP id adf61e73a8af0-3c08ecd72famr6686068637.18.1783441054198; Tue, 07
 Jul 2026 09:17:34 -0700 (PDT)
Date: Tue, 7 Jul 2026 09:17:33 -0700
In-Reply-To: <f2b2a3a048ad6429305e0e21319a8c27bedf39db.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com> <f2b2a3a048ad6429305e0e21319a8c27bedf39db.camel@intel.com>
Message-ID: <ak0mnZKoxK5Y04Dw@google.com>
Subject: Re: [PATCH v6 00/11] Dynamic PAMT
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Dave Hansen <dave.hansen@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, Vishal Annapurve <vannapurve@google.com>, "bp@alien8.de" <bp@alien8.de>, 
	Chao Gao <chao.gao@intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026, Rick P Edgecombe wrote:
> Sean,
>=20
> On Mon, 2026-05-25 at 19:35 -0700, Rick Edgecombe wrote:
> > =C2=A0 KVM: TDX: Allocate PAMT memory for TD and vCPU control structure=
s
> > =C2=A0 KVM: TDX: Get/put PAMT pages when (un)mapping private memory
>=20
> Would you be willing to take a look at these two patches that need ack's =
from
> the KVM side? I'm hoping to make the next version of this the last one. S=
o it
> would be great to get any remaining comments before then.

LGTM beyond the to_tdx() and Assited-by nits.
