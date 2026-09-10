Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57433CD8DE
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028697; cv=none; b=QcwG/C0onBlYS2IlTtYdSsM7+J3ay53Ygh7ENldLPj80PoRr5nIYfF2qA0QqKE2RdyRcc4uhbWLK5G2iGAFM4+SPfTh6G69lGC4U0rOFZj7tL/0TO81EELVrBx00vltW8CpXIb4kXqb4cZu1CeGjqLE6ebEnAXb5IeYT/6jLH9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028697; c=relaxed/simple;
	bh=B61a/cUbQjkdEQ7rffvXsppdLpcWQF9DSxMWIH8zJ1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uio/KDdOq5QGiXwAt7Cq7SokN9H4qFhwZsCLVNN2GUlTUkjkyKHJ9fGaaaCoOBAhsCB9uo7kLPdALo+xJw4w9CWEK7UFYb+6HcSZgVTqvdiJEoaKuTB07ZDLqVbirGQOKkjcHOIxcJP/nTPNJhP4OrkaUToPfIL0deofsi+jEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FZdtiQUw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FZdtiQUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789028691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AAjQRLHTm8PsWE9qctbGP9z9U2eKfvK/IKb+q8cgC0g=;
	b=FZdtiQUwovCQLn/EZBfHYwXoUAjDRVX/B8whkFTAHLrHwPyaYaqFx0yJ3+Gz1s/a4dppU4
	2kteA55pAty39MvxP5xCjbWRGeBkZYry3IqXkpxyASMsQtQQ9POLu8C9060zLQBFYfrnGJ
	GYniwxzZ3aHxx/0nr0jWS+ITcT74IY0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-V157H4RIMI2V24PygdWv1A-1; Thu, 10 Sep 2026 04:24:50 -0400
X-MC-Unique: V157H4RIMI2V24PygdWv1A-1
X-Mimecast-MFC-AGG-ID: V157H4RIMI2V24PygdWv1A_1789028689
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49991beee7aso62233905e9.2
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 01:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028689; x=1789633489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAjQRLHTm8PsWE9qctbGP9z9U2eKfvK/IKb+q8cgC0g=;
        b=Qj2suTdfBZ5kh+mfnpWzG/twh+GPzpv0P85AnUShOJr+U1If611uGx4x0fzMdtctIP
         sNuOTNB26tkKQ15Kus84ZE0tDsRmfKSRnnDKg8f8UrWvxtO9QYGCuOgBiGC0Tak1AeBx
         i5x1reaU3mjWXtlL8cpxO67UeP0wnDLXYcCUxJEjAD+dUBhpZAerPRCHuoN9UUJkOoXM
         9fYAIkjgiBz7wY+cciJ8t5Ge1kuIZgdRnY2FJM/UC4sbRtwnyL3TVXFgM7No9FMk403s
         nisSowASM9TtZanW+xvZ9/Hc8ELvb0EDQRO2uoAHBvM2MeGvo9PO5JkXj7G89oIMGB42
         Fqgg==
X-Forwarded-Encrypted: i=1; AKwUvBzWbA3ybwDxTHz4Zcvo+NsSbKfyXn4HCgO0tGBAaOevMCNbcCDVByf+N1YCkFAD86e6Ejzw6vbeQKa9@lists.linux.dev
X-Gm-Message-State: AFuF++lyZpG90TJxSkPoAO0ZZ5vqltjj+/t66BfT6V+Mvi3HPcPRb5qx
	yHFGrg3Am95gdKL/fCGKsdY6zQ/iEz1IAdfSzzR0YDqVgbXH2yMZaMuMMRBdG8sUsfrZz5mdt4Y
	c+7rFEaWcwBlE5JNzfRa+LqfmSEWP9inJwKB4QWoSPCompX5AyDkbL777NL508fQ=
X-Gm-Gg: AYBFou3ZHjKvuXiKZtregoxzdl0rm2v1P1PTeVs3iqujiAyDNHy6o6SNszihR6chmRM
	ycHDHgVpe6Qi0m/GVNcwPGsq7l9SyvWt3sCzeGkEqzPXNZ3QjQ+yO4Ix+U9EdYunnySaaNWjW99
	hOgreZDvtjVrv/flKnUwH2qW/1xMjdkyQbInkvOa5hQMEIY3GjY3nHMVdh7OhjjP/3V1EU1EV+W
	drwtkvUkUhOkrBC73RompPVcm0AovOIuAyaQ3sASTOBvT7rKR7IngtN7UgQ+27OQTJD2TnsJ53/
	RhF6JPT8DYK8VGI8f5V7WYr8CXTYBLmDROuhSvD5JU8k0c+nitipLEeUnTWyEgiBX5epMzCWPaO
	F+XUoTwOwFaWM0XtAPVlKCzZEVeHn/Rf3s5aJtKd7ilydsA==
X-Received: by 2002:a7b:cb8e:0:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49d2591889cmr81888845e9.11.1789028688879;
        Thu, 10 Sep 2026 01:24:48 -0700 (PDT)
X-Received: by 2002:a7b:cb8e:0:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49d2591889cmr81888065e9.11.1789028688366;
        Thu, 10 Sep 2026 01:24:48 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bdbb02sm50710245e9.3.2026.09.10.01.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:24:47 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:24:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Gokul K <gokul02k@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/sev: Do not fail SNP platform init if the vTPM
 cannot be registered
Message-ID: <aqJoJBNEpyKpKKix@sgarzare-redhat>
References: <20260821053411.1215497-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260821053411.1215497-1-gokul02k@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MzyFAoSgAt97cKuga9ylke9jTQiow7vsiM5gEIOOtEM_1789028689
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Aug 21, 2026 at 11:04:11AM +0530, Gokul K wrote:
>The SVSM vTPM is optional: snp_svsm_vtpm_probe() returns false when no
>SVSM is present or when it does not implement TPM_SEND_COMMAND, and
>snp_init_platform_device() happily returns success in that case.
>
>When the vTPM *is* available but registering its platform device fails,
>the same function instead returns -ENODEV, after sev_guest_device has
>already been registered.  That is worse than the absent-vTPM case in two
>ways: the sev-guest device is left registered while the initcall reports
>failure, and the error tells nobody anything, because the return value of
>a device_initcall is only ever traced, never acted upon.
>
>Log the failure and carry on, so an optional device that could not be
>registered no longer determines the fate of an unrelated one.  The vTPM
>is simply absent, which is a state the guest already has to cope with.
>
>Fixes: e396dd85172c ("x86/sev: Register tpm-svsm platform device")
>Signed-off-by: Gokul K <gokul02k@gmail.com>
>---
>Compile-tested only.  Reaching the failure path needs an SNP guest under an
>SVSM whose vTPM platform device fails to register, which in practice means
>-ENOMEM during initcalls; I have no way to reproduce that.  Built at W=1 with
>CONFIG_AMD_MEM_ENCRYPT=y, and confirmed the file is not built with it =n.
>
> arch/x86/coco/sev/core.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
>index ecd77d3217f3..6501b6f7469a 100644
>--- a/arch/x86/coco/sev/core.c
>+++ b/arch/x86/coco/sev/core.c
>@@ -1401,7 +1401,7 @@ static int __init snp_init_platform_device(void)
>
> 	if (snp_svsm_vtpm_probe() &&
> 	    platform_device_register(&tpm_svsm_device))
>-		return -ENODEV;
>+		pr_err("Failed to register the SVSM vTPM device\n");

IIUC platform_device_register() fails only if something is really bad, 
no memory, device already registered, etc. so IMO this should never 
happen.

I'm opposed convert to an error message, but honestly I don't understand 
which problem we are fixing.

Stefano

>
> 	pr_info("SNP guest platform devices initialized.\n");
> 	return 0;
>-- 
>2.54.0
>
>

