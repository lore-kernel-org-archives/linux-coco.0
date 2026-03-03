Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D29373BFE
	for <linux-coco@lists.linux.dev>; Tue,  3 Mar 2026 19:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772567058; cv=none; b=Avj6MiZx+LsfreSgFTx/Dr8jJlGdiPTh0FlwZHrJvqeQS5oZtb1e5QVGNqFQLcUAV4NLM4Bg8wQTxz5e/cIip/7vZo37YfQuGEkqjmmQlQXAap4bGY1FUeY1xadClch55W5/M7gjaa7uqZWAs2JTsMd6vtJ+0hwfus69RG3p//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772567058; c=relaxed/simple;
	bh=4pso3iO729dZpcd/ENmTltLyuClEQkS5sXGDOONqMh4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ez2U9StQoFv4yg9jv86N4yg6G6nvj9ysLA5IK0/bxqtbbTjFHQ+7+rDhiPVsJESUD47dCj2khskRgqRxkKENwptK7TruhsrRYCCS/sJfiDCrrTYPoBtby6vNBuz1WV4bROmv8fNyWyttrbysl4Syc8IIsbeikONTgu9o/oq3Pl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bu0GqgKh; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bu0GqgKh"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ae66ee7354so3838725ad.0
        for <linux-coco@lists.linux.dev>; Tue, 03 Mar 2026 11:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772567055; x=1773171855; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7H8zcNkOosHL5Qyyqu/2sQSqxUPrIKJPaqmDB4tPT+k=;
        b=bu0GqgKhAbNpjd4xpzppXdCEO1+JK7nKRCfVvju4vODL4zqc43nuwY2BU0mLkSTSMV
         tss2zNRHus/Ah+YQXxIajfjBvPaDH36TMhYqzUdj6CAPVNuyS2KVvzMvcqUm/0TbabmE
         UW2FYI4VcDoFKKI+W+kJJrMLWfP+L+8jdxHpU1WlwIP+owMt+jXh7HqXpqdZR7mbhNFw
         hEZyOzdHrnTN/kKX/yMLRYCC169IEmCdfQ+8fftrlXRJu2qVlyVb75JNK+eEoU0o5QKH
         ReiTrMRjZESH1MgHWsGijRlID4XrLV56VejUV6mfxPPpDJ6mxF+5/nKQM45wpZRy58B1
         La9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772567055; x=1773171855;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7H8zcNkOosHL5Qyyqu/2sQSqxUPrIKJPaqmDB4tPT+k=;
        b=Lei36Tcl7vj5Z4rthIRbyG1tFzfWlXT3bzZKQJlwbriqeDPVxlEZ+rNX5P5Zta1Y92
         YdhnYEU9VoguAm9Ig7mSmvHDsDemEJOlwUdeqOznFWfU6ReM3Bm2ESvuFB7hzdPNdSnQ
         vHS6oUrg6EFGXNqwCXu5PVnzEML3NFpaDyqG+9AOImbHKNE9mlVXP6yUYze1FzgYjjFf
         iNdZIwit3z5ELfR6dCq1w1kximCyufaNywErjmGkvQmvUZvSpVbhsVYhWNNUKg7woR0a
         RxiNGD9pGrXzaOmK7K9j6xpkYtv+ZNfvZFXgkcerLQrdkSJZjU7XOXU55R7O54NV9b85
         F3iA==
X-Forwarded-Encrypted: i=1; AJvYcCW6/y1ZMZxz77nsJeUwR8pOWDPOQA2UoqvaL6s9cdBxLtg39cv2KEg9Ocd+fiqfhq8f7cEmvcYJuK0p@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1r752NtcJ0C48jMz8iaeV3XhsjWZ9K7hEJRpHKlYl6Rh2KArd
	zdnfYvuRLgK1UKwav07QwWohZP5HiZkD+0JSsPm2kgxrDlMbYJtOqvYw6ewgqvn+21nfnvPLAok
	pSqx8xA==
X-Received: from pjbrs8.prod.google.com ([2002:a17:90b:2b88:b0:34a:c430:bd91])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2b06:b0:2ae:4996:430b
 with SMTP id d9443c01a7336-2ae499644cfmr108344665ad.26.1772567054562; Tue, 03
 Mar 2026 11:44:14 -0800 (PST)
Date: Tue, 3 Mar 2026 11:44:12 -0800
In-Reply-To: <4574be9a29d75d565e553579ef6ce915ef33b19b.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225012049.920665-1-seanjc@google.com> <20260225012049.920665-15-seanjc@google.com>
 <8bed2406e9f5f30f8f01c1da731fae6e040da827.camel@intel.com>
 <aZ9MDxJ1iEhIbJJ6@google.com> <aaZGTY3CzhaCb1lc@google.com> <4574be9a29d75d565e553579ef6ce915ef33b19b.camel@intel.com>
Message-ID: <aac6DGISvMX4krhb@google.com>
Subject: Re: [PATCH 14/14] KVM: x86: Add helpers to prepare kvm_run for
 userspace MMIO exit
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "zhangjiaji1@huawei.com" <zhangjiaji1@huawei.com>, 
	"kas@kernel.org" <kas@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"michael.roth@amd.com" <michael.roth@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026, Rick P Edgecombe wrote:
> On Mon, 2026-03-02 at 18:24 -0800, Sean Christopherson wrote:
> > Ooh, better idea.=C2=A0 Since TDX is the only direct user of
> > __kvm_prepare_emulated_mmio_exit() and it only supports lenths of 1, 2,=
 4, and 8,
> > kvm_prepare_emulated_mmio_exit() is the only path that actually needs t=
o cap the
> > length.=C2=A0 Then the inner helper can assert a valid length.=C2=A0 Do=
esn't change anything
> > in practice, but I like the idea of making the caller be aware of the l=
imitation
> > (even if that caller is itself a helper).
>=20
> Seems ok and an improvement over the patch. But looking at the other call=
ers,
> there is quite a bit of min(8u, len) logic spread around. Might be worth =
a wider
> cleanup someday.

LOL, "might".  :-)

Definitely a project for the future though, especially given how subtle and=
 brittle
this all is.
