Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EF614A0A3
	for <linux-coco@lists.linux.dev>; Tue, 17 Dec 2024 21:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734471464; cv=none; b=IMLBXxNWQsgPQc3WXjgOtO+zeyRaiyc9S662+RxhfnF9iDeQQKsceaQTCcgs+oQu1m5+9tNig/TgYwh/nDKra170t8kU0603e3M9OPjyrHZXkbcGRq8m2w6S0WC+OKWP/KKwSqrfczusN3VXFVXr8DXjBcFqoXlWOXJ6wzrCxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734471464; c=relaxed/simple;
	bh=FR0P8x7/9ngEgKiXbPcjZ9SkDVlLITONVwCAUmfHs9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AFSB5d8//sbOBmsV9zI0eGaJGZDix6YqSgEw9X7rY96OqlxPfrzvdNwWAAdg7V1D8l8WXtaqVvAw43/f+NCvl6QeXL2lIBu6DOTepchXi0MO5xmFKUrEyEdNLbcsKOKEQ2+QtTxMgDAG0wMqyiWAAcin6+FRnEi6wcHsopAUKOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sKulU7AS; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sKulU7AS"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7fcca85ffdaso3522209a12.3
        for <linux-coco@lists.linux.dev>; Tue, 17 Dec 2024 13:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734471462; x=1735076262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rw3V5l3zgEdyqeowifhhV2t/72Ab4n6g+8l5OuuzZOM=;
        b=sKulU7ASS97pK+4Qi4zGGSOv9NUerwC5FU/l/ezxbx4pFEQoslQBIxDkee6hphItd9
         Nu48LROj0WtWT6M6nDgX6dfcljo/JjFogsesoQsUpYBNuX4JsTD430Hq+wyNOp0440dv
         e6XcwJ3WVRyfmUTCdeNW7EYxs6avq9aBtAEB+GTlQgtUzihainOPITK6MlotsXA12Fvw
         0u0wf9sjiVJg5FDyqDNwQjrFbEZKUjoJn0XfQ/e1jC6Nbl/ZaVpgnK9QvBaf9mFWj4p+
         rpeN6CS1DjPDTKfPWd96rSNQYefANeos1IauMQMg2kGRQlMJJ8mShen50q3G7NosO0Qo
         rWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734471462; x=1735076262;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rw3V5l3zgEdyqeowifhhV2t/72Ab4n6g+8l5OuuzZOM=;
        b=CryOGmUTcGF0hrSM2EyYKQMlsObJmRjg93suGgUsDpJAHF60eB1ogYkhGdk3EHFLOd
         2y6Dlv3mo+cZ6H8QpJLW/gfeUyUDUOY1WTyNZdONV5IKZSaILs2VjOXnhl+8isPpNX6p
         UF06dIrBC19IvKrKKprGORRtQ4WGt9j0YYIb34PB0imN0N2MrOqMyYizQ4WHfANa4Gjh
         SR+lEAn8pVoOfAmpfSOrvCtvd6kUNFKWIw2WcbxO8K4VuPhdgEnF4YXNEqu1KywG8RSC
         2oEh3eyFTMR65PDIEKmyTVWHe0RLc2pjpEn3tmBIjswdQAiGPXdC+CMK/OSEw68NfvMt
         kemg==
X-Forwarded-Encrypted: i=1; AJvYcCVI5M59zcFTtfOyFQ9IxzcO1pe3Sixfvfga59ttJJ6Gjr+WKBVqu8FjbGQQW++XrkZTitBG/g2/SHyD@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq+BtudaNaWhLRVA8yvtlmjnI2rCrdYBS/3xs6Wthrl/8c0n89
	0iWtmi4ZNO743Wlp7si/HwVGpOXft0XoOwVXRPFZpoEdYBvO7tB+Pp5gvVfTfGwaALc0AHOOfW4
	WRQ==
X-Google-Smtp-Source: AGHT+IHkBuqTQ7UlVlQLJaGwJ+fr7nw0ge3h4GeiLflYNngZHZg+PnIluUNLdsY9fVUJdSpCtTapg9gTOXQ=
X-Received: from pjbpd5.prod.google.com ([2002:a17:90b:1dc5:b0:2ef:6d06:31e4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d88c:b0:2ee:b6c5:1def
 with SMTP id 98e67ed59e1d1-2f2e91a9f37mr670257a91.8.1734471462252; Tue, 17
 Dec 2024 13:37:42 -0800 (PST)
Date: Tue, 17 Dec 2024 13:37:40 -0800
In-Reply-To: <cc27bfe2-de7c-4038-86e3-58da65f84e50@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1734392473.git.ashish.kalra@amd.com> <CAAH4kHa2msL_gvk12h_qv9h2M43hVKQQaaYeEXV14=R3VtqsPg@mail.gmail.com>
 <cc27bfe2-de7c-4038-86e3-58da65f84e50@amd.com>
Message-ID: <Z2HvJESqpc7Gd-dG@google.com>
Subject: Re: [PATCH v2 0/9] Move initializing SEV/SNP functionality to KVM
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, michael.roth@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024, Ashish Kalra wrote:
>=20
>=20
> On 12/17/2024 10:00 AM, Dionna Amalie Glaze wrote:
> > On Mon, Dec 16, 2024 at 3:57=E2=80=AFPM Ashish Kalra <Ashish.Kalra@amd.=
com> wrote:
> >>
> >> From: Ashish Kalra <ashish.kalra@amd.com>
> >=20
> >> The on-demand SEV initialization support requires a fix in QEMU to
> >> remove check for SEV initialization to be done prior to launching
> >> SEV/SEV-ES VMs.
> >> NOTE: With the above fix for QEMU, older QEMU versions will be broken
> >> with respect to launching SEV/SEV-ES VMs with the newer kernel/KVM as
> >> older QEMU versions require SEV initialization to be done before
> >> launching SEV/SEV-ES VMs.
> >>
> >=20
> > I don't think this is okay. I think you need to introduce a KVM
> > capability to switch over to the new way of initializing SEV VMs and
> > deprecate the old way so it doesn't need to be supported for any new
> > additions to the interface.
> >=20
>=20
> But that means KVM will need to support both mechanisms of doing SEV
> initialization - during KVM module load time and the deferred/lazy
> (on-demand) SEV INIT during VM launch.

What's the QEMU change?  Dionna is right, we can't break userspace, but may=
be
there's an alternative to supporting both models.
