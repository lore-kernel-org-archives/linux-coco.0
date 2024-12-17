Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77FC1FF5F6
	for <linux-coco@lists.linux.dev>; Tue, 17 Dec 2024 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451221; cv=none; b=MHeyDjVeEPGf7gvkTEDtNFzQmvsOysKd1JrTGpHjU79MOPsOa00i2PmZKD+I1/z2/V4wqGsbnGJMA5+Q+DetigxWE/seFygS+ygRVxCB8la5sQxwroWJQ32p51nASgs55huiQcFbapqWc5rxJJlSmrA5rmqT+GDb8SVTvAsOrTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451221; c=relaxed/simple;
	bh=yMkXhimHSNgkCBtW6GdCu0qlZ/ulIAiC5pNf9JbKmis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMiwiXAaiO/ws7Q2Zi40MCrvPem4rwhbIUshzE+tnoCc6XhOw7mywmxZsAv6X5Ru3wHiPm9WBCvpjbBzuPjwQWytAq3uGYnKyykoYP77gX3ITD+aL/aLjupDzT6r+V9OpeKId4bmnffn75PXLtFfQoc/ZYOolr4/+u9kOS8vNbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sHtcv2EF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sHtcv2EF"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa6b4cc7270so734437266b.0
        for <linux-coco@lists.linux.dev>; Tue, 17 Dec 2024 08:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734451218; x=1735056018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMkXhimHSNgkCBtW6GdCu0qlZ/ulIAiC5pNf9JbKmis=;
        b=sHtcv2EFsfdBi8exovITea+nb50/dHuWgb4Y1Wdf0YeVjghtj+pIJy9JlaNJfhHbYV
         bKiaE/Ese0pup2nCF0LPQLWHCRdIWeoSBb/Phn3GZUUh7QdA3TCYkZaVUrfJApvYPCAI
         ZLtkedWnTxFQH8jHDsX8Vho3FouQ/wWH0Z2HJLzN5+xIbIX2WThHRG8/E2SUpVMXgKar
         pIjpZiYqH+Dp+jgZALVr8/bM5C8H8bMGHmsxevcsO7LxxhqjojnorrUvyXvJ+oB93hbZ
         VnWveQJjN2hQzOg2ZFuVqixpCRGFwzs4hJX2FToXJwbXYA7EmhutcI1Oh37ItJh8sJLi
         JAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734451218; x=1735056018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMkXhimHSNgkCBtW6GdCu0qlZ/ulIAiC5pNf9JbKmis=;
        b=kxbY31dONZRv1t/WrACyqV/cfRWx+G1eF8c6Jonlim+HJ2fnSIRSKue0sCk0t4zAIG
         0MNSppl678/ADlna6bXn/+TCqEgElhT0UeOT+Ul430JSfKucJARgiUzoYwTO4UMdaYqR
         To/f0SCa/yFUIYiHW+coQ2j7XMUjA5pPn1qfZQMBXDRyEcAqc7fktj/upHmuSyPzKZGQ
         xkKDZxtOqEkD4S0wg3i58omEAyzv4zYPATvw3aC8b7ByIQr9uK2Vtz1JpxDa8WvvQJSK
         LgOkMq9lHp0ajA6DbBiRfS8l46Hz4RyTPl/aMZdGS+zSVA9pUSEeGAdLqCFtJahj+pWI
         V+eg==
X-Forwarded-Encrypted: i=1; AJvYcCUISpc2KoJjsCFLBcrnXAUorpRVV61qCkQqEH6iSGiIgApoa4WRNpONoQvoy2nvPkrdalMHzFqab9TJ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvr9r3R60ubZcYp3I11QYPozRGbSI5Nh/WXDEa/OXBmDPxkP5w
	irrA9pcR8Ja1k/3E5LItV9pbCARGJqsTNftPpWdXBssmQ7/1hxEDSXfGVvEPWUbiiP5azt1pj6N
	MirHUg/BnIjV+rXYmC5s/BzoOEgmI2lUu0as2
X-Gm-Gg: ASbGnct7zgjN1AOoubxT8DNJH4ASCwfBLWPC85J++d8poW/U7pktJs9kpb5N1i7G7Vu
	lNNqtppr0ULrzFhrzfL4Z1gOeaAg0WOIH0SVzhw==
X-Google-Smtp-Source: AGHT+IFNZC7Hw++tMkFStafWWMV/GkZvsv2xsoec16XXjJA34YsckivhWJKovnlU3n2/vwLA3YFKSwnXRytZtX+iWQc=
X-Received: by 2002:a05:6402:5415:b0:5d0:bf5e:eb8 with SMTP id
 4fb4d7f45d1cf-5d63c3dbc28mr38182350a12.23.1734451217876; Tue, 17 Dec 2024
 08:00:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1734392473.git.ashish.kalra@amd.com>
In-Reply-To: <cover.1734392473.git.ashish.kalra@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 17 Dec 2024 08:00:06 -0800
X-Gm-Features: AbW1kvYYZJqPhmb3aGCl1ViLv-OIblMbuwwguLZErK06_FPk8Pypubp8GuwTI4k
Message-ID: <CAAH4kHa2msL_gvk12h_qv9h2M43hVKQQaaYeEXV14=R3VtqsPg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Move initializing SEV/SNP functionality to KVM
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, michael.roth@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 3:57=E2=80=AFPM Ashish Kalra <Ashish.Kalra@amd.com>=
 wrote:
>
> From: Ashish Kalra <ashish.kalra@amd.com>

> The on-demand SEV initialization support requires a fix in QEMU to
> remove check for SEV initialization to be done prior to launching
> SEV/SEV-ES VMs.
> NOTE: With the above fix for QEMU, older QEMU versions will be broken
> with respect to launching SEV/SEV-ES VMs with the newer kernel/KVM as
> older QEMU versions require SEV initialization to be done before
> launching SEV/SEV-ES VMs.
>

I don't think this is okay. I think you need to introduce a KVM
capability to switch over to the new way of initializing SEV VMs and
deprecate the old way so it doesn't need to be supported for any new
additions to the interface.


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
