Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16B268FED
	for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 21:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739309524; cv=none; b=TA3XluzCmPAGaFljGjFc8BAFNE+qgjZCnBdPqWVWBGM2JaXW6jOpEDV7Sjl/bwcids2627wdPn2MwBqB3YS+7bVF+s8FoX2TCZgZUby2nF7Lo8RurqwulD6kLUJtorqVtMAfu+fDRrS+2i9gP3AEFewtfDkkan4hGLs2oiUzn1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739309524; c=relaxed/simple;
	bh=+LUKvtaq5+tVeSV8nn8P/esQQflfMiqhA8o10k5cyOo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eA23o3z6fwgNWnZpT5HH+wlhXgYfbOkqgXsogtG3wuho9chESSMFK4L2qTzEpjn/4xr9YKK8PzwNoBAt+BYZ5HDb/dLu9kd8gjJpvU5zG+ytuVbSmEja9eAvgmnzmd3xZDJifFvtKcJBtefYo9FkSCt+vAWuRY+FjluKb4MVI+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m+pUU6lO; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m+pUU6lO"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21f61a983ddso151073765ad.1
        for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 13:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739309516; x=1739914316; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VkaRbODbKGzYYO3d8B5U658Dnrd7njXNzj1iv9zbjaI=;
        b=m+pUU6lOYjRWC3QVyxxOIShGpgW80IGDxRXEl6g9GwISPgbvyarkJPrByIhUZvjKMz
         qQE+3NrZDs5qk6STJqV8pNazqmukR0uZdbHOhEsgoE/qfWQjLw4PzIruL7GwGZ/1OMvp
         YWpPljIh76COyT4cHXzjNdng5ZwUdBISHMtrVFZpAAlFbKCHHKjeV947h2WAN4/xHTjM
         aQn6ADL0IpcIgJ6pkSWGGanJ3N/EIC6trK7xMl16UBXhWkDv320KZIHlUxuNlFzACnZ2
         LXbJ+8tQEPsPaWnLEUthPhEQrvkU6/7FA0BsD1y/4q8/Op9lirKC7I48zZPWEwCze6DY
         62Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739309516; x=1739914316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkaRbODbKGzYYO3d8B5U658Dnrd7njXNzj1iv9zbjaI=;
        b=lgcBLbvcVOi6xf7M5mo50FMWEXx2PatybjsZNxKSzg6VAFI11piUGs9AwOS2siiOzX
         ahV55QKT8pYzExTBqH+kJZuh7RwSh9SbrPwf+tXesEPm0RTTdXRlRXs0ewozn9NmPQgg
         l8Tr+pqLXJDfa/uNTxT/1wZ5Zg4jdNB2Oc7aiS2lZapSiXlxf9fORMwDl5rTWc8X0F5i
         ZV+TTm0tBixT3YxYHPJBeO+erEMXsWYXeT2ThAsFAG4Yw9XrnFVu839Q06XwlbY4DqR9
         W6LiBPGDurgzz93r4ofBRh/AWWYtygXf5vFAoP38p6cA2uBu8364MT9WQ66DRMHeu3M7
         cvtw==
X-Forwarded-Encrypted: i=1; AJvYcCWXRPQjZjgYmwVyxGjquViU1wRoNZ+VARacNdJlYt4/TxI0kp7SvA+B5rstTWbaBDLcprBQrThIvnRL@lists.linux.dev
X-Gm-Message-State: AOJu0YyBC+FowcxUfKxiQBlcI4wilPuwBQgA4RJoKZhkl0HfwQfWvV9E
	yWd/p1jnUvw+kit7rHxxb2UhUt6tqxtbQ29opMo3jBlg1/kUR0XynkC3v+i3k/PvAeLFktdZTiW
	cGg==
X-Google-Smtp-Source: AGHT+IF0fRIVtQzGjHRyYmnEnH/8CimtcIxuPGCWLPNdmuUYuFVbVgvZHz2rDvO254ixr09jUnGGcU4Rzps=
X-Received: from pfblb14.prod.google.com ([2002:a05:6a00:4f0e:b0:730:8a7b:24e0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d06:b0:1e4:8fdd:8c77
 with SMTP id adf61e73a8af0-1ee5c733c61mr1455053637.8.1739309515854; Tue, 11
 Feb 2025 13:31:55 -0800 (PST)
Date: Tue, 11 Feb 2025 13:31:54 -0800
In-Reply-To: <cover.1739226950.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1739226950.git.ashish.kalra@amd.com>
Message-ID: <Z6vByjY9t8X901hQ@google.com>
Subject: Re: [PATCH v4 0/3] Fix broken SNP support with KVM module built-in
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, joro@8bytes.org, suravee.suthikulpanit@amd.com, 
	will@kernel.org, robin.murphy@arm.com, michael.roth@amd.com, 
	dionnaglaze@google.com, nikunj@amd.com, ardb@kernel.org, 
	kevinloughlin@google.com, Neeraj.Upadhyay@amd.com, vasant.hegde@amd.com, 
	Stable@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 10, 2025, Ashish Kalra wrote:
> Ashish Kalra (1):
>   x86/sev: Fix broken SNP support with KVM module built-in
> 
> Sean Christopherson (2):
>   crypto: ccp: Add external API interface for PSP module initialization
>   KVM: SVM: Ensure PSP module is initialized if KVM module is built-in

Unless I've overlooked a dependency, patch 3 (IOMMU vs. RMP) is entirely
independent of patches 1 and 2 (PSP vs. KVM).  If no one objects, I'll take the
first two patches through the kvm-x86 tree, and let the tip/iommu maintainers
sort out the last patch.

>  arch/x86/include/asm/sev.h  |  2 ++
>  arch/x86/kvm/svm/sev.c      | 10 ++++++++++
>  arch/x86/virt/svm/sev.c     | 23 +++++++----------------
>  drivers/crypto/ccp/sp-dev.c | 14 ++++++++++++++
>  drivers/iommu/amd/init.c    | 34 ++++++++++++++++++++++++++++++----
>  include/linux/psp-sev.h     |  9 +++++++++
>  6 files changed, 72 insertions(+), 20 deletions(-)
> 
> -- 
> 2.34.1
> 
