Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2E510957
	for <linux-coco@lists.linux.dev>; Sat,  6 Dec 2025 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765048898; cv=none; b=Dd0B1P5pg9PqssN0lVvAzrmutVJkoIdPQrqVuww5XEt7uJDvBr1xkl8O+qYzvhZ7DajFEOVUV/9d0EpX8YC2fKRRVxz3SO0SQRRqKDQAUlR1tNhnwzzJVDjCeb/a0Xkl5bVLu2gXD/6ePyhNvDsKdzSW6XjwFuM2wRN/kuP3uuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765048898; c=relaxed/simple;
	bh=hgNUVmtl4mfYg9LW3etbEEze6yO6cETokzqvLHjQeAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1BTTLEJwxKtQlq6Kdqj724PrQWaYRc5Npnfwpl2ht2P9IDFJrdBnWhGHGjeet/6HN/08UaYJvrFIJQRgxnvlUIr/OJyjPepBFXV/9IvJ3dPRAlLYGvXvEFfKYj7o+dHPwrsRrs1vIGDqkVUJHyQeeNNlnrD9H6v+uzRep8FFkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GkIoYCTA; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GkIoYCTA"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b79f98adea4so358959366b.0
        for <linux-coco@lists.linux.dev>; Sat, 06 Dec 2025 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1765048893; x=1765653693; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlnfGUYYvUGsH9rhKskM2mNvUgt3d/8KYaqEF2qulEo=;
        b=GkIoYCTASvoON8YUz3nMANZq17tYtATFUIo7mJ1ZnL19IZ7vnx0qLVUuYUGi89CRlI
         Gm/0Zcu9cWGUYvMkCNTEPNWANsn944L4EYb8DKbk3pglO3N5PeHkMaImb0/qITMibDvR
         qFbEkPPUN7iognjBrCMHh9+rG50pDFQqiZkSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765048893; x=1765653693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlnfGUYYvUGsH9rhKskM2mNvUgt3d/8KYaqEF2qulEo=;
        b=tSibeYvwuaDe5skUec4qTMNnalUwjct+npp6FJgOzqGnAObPti6c0xfWqPczPR6fLK
         QW5oXWFMPPEDwKdcjAnxkPJtBVk39fl9Sz/ERRS5dTANbvCDMg15VvNdVGwgh5OXgcif
         v95FG9b9pe0sS6IDqoeHXPuBGpkJJD+S+UKzBMBxjw6Dd9s4z8btfYhiNpOm1lQjEwJf
         YuE1IwfwwzYRDnXiQpjq+xb9ZFsW0fwJ+dgWMtyYm9CLzEMxWXPmWTI/Tm9TAJFWCdtS
         CXPKWbhcpHkcpug3xdRsP8Y7NL1fbt9NlYtp2CLwlMdnaRKR5cw4xoUvrmicuAnXNKI6
         /bFg==
X-Gm-Message-State: AOJu0YyPU//3tQFSxGRTrCpeBXYiJuqWt5cd9TyhZ8WvuASEpzrPRfSe
	wQvE1O8fdDmnGFk+6kcscp6gNKjOPQroyjdTjfvyYXe42v0YKJr5YlbCwUDOXaEZ/3BowvrBphK
	LbEUMdKY=
X-Gm-Gg: ASbGnctXECKQzTtr5CPj28ls0XJMoT6D5UX93fateI7Flcm2Gd3J0M5zjPGK6yUhGXy
	7Ygr4w6Uw9jM+dhny6+65xVbh5GUB/cUJWUUcuoEwd8mFvl2DS95oMCltqIgAJCSR2CZuvyNAzQ
	EQ7GxNDMsqiR4zSUcf8pVpknl62/uCuREDyvg9fGcCGvGoROWn0z47CndyyjRPDDZGgAKApQDWl
	sLVdYy99nLBlYsj1JjESbyQXS5Y6ug1edChu8ZDDMelG9FvUr3UksA4OntXbDmbgsm7BcMABWOT
	0pWtmjA9HQ1TWNIFo+w1zW1RiUdwHRRavdjncr4OXlnAWtZ3nDVycrqYE0KasWSQdze7vwqjktT
	WzPXKryAsqFtRi3EZMtl4zGUVi/Bi/zGXFR8JuSlMe4bQa7TaTWUE+hBIIs8F3kJld07LK+ZUkq
	/S1KlQUGGHc76pdzhhlFXp9aPBjYLD/cu3HtP5brUgD5WSmjqHbra26J+0rIy8
X-Google-Smtp-Source: AGHT+IFwusZeSNEuNjWvwugXwMwPlU17m8wpHh9kuD5Gc+/se+6RuON7a6xyz924YHSFEB1UwPxVoQ==
X-Received: by 2002:a17:906:c108:b0:b79:ecb0:db74 with SMTP id a640c23a62f3a-b7a2483c9fbmr340578066b.59.1765048893187;
        Sat, 06 Dec 2025 11:21:33 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f449d76csm697916866b.27.2025.12.06.11.21.32
        for <linux-coco@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 11:21:32 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so5821068a12.0
        for <linux-coco@lists.linux.dev>; Sat, 06 Dec 2025 11:21:32 -0800 (PST)
X-Received: by 2002:a05:6402:3512:b0:641:5bb9:fdfb with SMTP id
 4fb4d7f45d1cf-6491adee818mr2590328a12.33.1765048891924; Sat, 06 Dec 2025
 11:21:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <69339e215b09f_1e0210057@dwillia2-mobl4.notmuch>
In-Reply-To: <69339e215b09f_1e0210057@dwillia2-mobl4.notmuch>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 6 Dec 2025 11:21:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh9dTX5eg0+NruSDbOCT_tafsO=a8m3cbhxFBvt-21bxQ@mail.gmail.com>
X-Gm-Features: AQt7F2psuKzNOwy7lHUf032auHjsHnauIDDjO0WVF0-O2w7bGqwfN-hMc0aXYO8
Message-ID: <CAHk-=wh9dTX5eg0+NruSDbOCT_tafsO=a8m3cbhxFBvt-21bxQ@mail.gmail.com>
Subject: Re: [GIT PULL] PCIe Link Encryption and Device Authentication
To: dan.j.williams@intel.com, Alexey Kardashevskiy <aik@amd.com>, 
	Joerg Roedel <joerg.roedel@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@linux.intel.com>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 19:08, <dan.j.williams@intel.com> wrote:
>
> Alexey Kardashevskiy (4):
>       iommu/amd: Report SEV-TIO support

Bah, I've merged this and pushed things out, because my allmodconfig
build was fine.

But more testing shows that this is broken.

The amd_iommu_sev_tio_supported() function is only defined for
CONFIG_KVM_AMD_SEV, but the <linux/amd-iommu.h> header put it inside
the CONFIG_AMD_IOMMU config option block.

So if you have AMD_IOMMU enabled without KVM_AMD_SEV you end up with a
broken build:

   ERROR: modpost: "amd_iommu_sev_tio_supported"
[drivers/crypto/ccp/ccp.ko] undefined!
   make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1

I've pushed out a minimal fix that seems to work for me.

Please check - and be more careful. This is _not_ some kind of odd config.

              Linus
