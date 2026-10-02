Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A51B472772
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936438; cv=pass; b=ZjulDFsjO75id3V7nqd8JRW73eJznTqwzMbd+lIe3k7KTYUbauzSKkC1nqRMoMRbPqOGWvUwMynYQ75/kQwNZZ1TgybsI7FpLZuwU5d3sAgZxqqbnEAiIYkUZCcc/ZzQ3FrqJ7IBMz6wREH325p9DLW0gKvPf2jC3tvdDFPjMGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936438; c=relaxed/simple;
	bh=UOMj64A4DoXhOCxEjUECHTEJP1J0iaV3eziuUdVe8QI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHhc2hswuRyR+kukBv75v4hp0eKFRhEwdXn8qL8bgVhIecJVDTHhTVDdhNVKDy9Qx4F/6IInv5YpY1rTs11Rh8HVkxOgxrc8aI+qWXlSlzmpyZU7YznI64XEWqdbi0nqQEkmImghWbftglaZKFO4AI+IsCtBquszbG3AeT3wvkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kew7YPrP; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kew7YPrP"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba4065fa07so6733e87.0
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 03:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790936434; cv=none;
        d=google.com; s=arc-20260327;
        b=iZM+RGpWkcR3DCp5CXIl9eN9j3UMIUz8GeR48+CzMUaZa3EX8A4e1IvZjIlP8vjV06
         Ci76sQo++snW7biU52TwZ1RGVXc165apjqKrWmb8okUZs+3Gk0aanTpDjthseDbrGju2
         cdibCa0WACRQsvRhooON9ObBelbKLvdZ5EW6JuCK2xVL4eddOKI/L2Y4mWgtHLitzwPh
         JK9cqgYJqaLVN5FYW+Jq/XT9EsnOWL11r3Te+nQsUNxpOnTWz1oLw29Hy1cochR+/vC2
         zet2egND84hGBV8yOA4L10L4djFpXOpnBc4cz7ur7bWZ2J0Q1RGF9ZU/9JwmsIYloan2
         fdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AWVQCSwR0aUoymLEu54Qp5SBrR33qbmFDxb/OCitD2E=;
        fh=q0HYup2xmifsK6m8F0XPyDBimYArSUDSNq2Df5PwV8k=;
        b=RBNsgLQf35jW5OmjhFiUzeikujk0074p16v4jFrgiswKNzfTjvyhlHJJ2kPEbW23Cy
         UYcj19ou+Ly27s2GD41jKYr2pkqEoDMcubwEKYkqFsw5wLk8KtGZwiFDtMtLQh68HpyU
         ONagYwVFfNMmPkY7VkaDQyTFso3tfFH0mILwpwwFvCv3xVoZ5T20+3xl2l9oVU54OxhV
         UFj9WuLZVb54MB1gWBYx8s3gUb6o1MUIu4nKN/W7kzCz2KynTx8RQ8wambpPcJMqcyh+
         ELQR1QZtTWlkqcKb+WtYDLeCTQR22ETvuKE+Cbdy/jUo3hJ6XQ9Vgv6ydfUzeHYENaAJ
         oB/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790936434; x=1791541234; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWVQCSwR0aUoymLEu54Qp5SBrR33qbmFDxb/OCitD2E=;
        b=Kew7YPrPQH8lzf9TU3+B9DKi3xYmeACDnjjWbzA95Qjngq37SqwrSsfDDGwCfQOoI6
         pxaztmEyNAAkBg8Etaxyiwf5pKFsq+Asz0RuXk5B/3+aaGFinRitTZ/Yv/tKxXJ2D6AI
         8FbBnlwFnwJh0thmvYCN6dNO1cXQxYfqZGC6J5hIrLs6/JzENpnTbGM5lj1BgYQzNK7M
         WvzmAXreZEDUVbsAnXopxifkJ7EaX/5nmT4RJ2FcsLkvmrW88QyElXtHDLVYACLR59Dx
         EqP0bZmh3xh0mPFg9XDXn3Yif28qp6qj2ezEAJXuJKZcDAXeTCWuUIcYQrBp1M0PIxKa
         ndQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936434; x=1791541234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AWVQCSwR0aUoymLEu54Qp5SBrR33qbmFDxb/OCitD2E=;
        b=CLlUKESc2XsByqYDbg1G+u/OcFWWAAPeljIHsq+rkt+WYxWCqAqA9B/DwxuUwhFVjH
         EHhvVAAOCeZtAe48/Dj5SylfbVxPpIwlGvIaSYRJ/ibRG5OzIIC9+yrPpjmDx/zYj839
         uyN6gZq3ZIj44h5M2ipbHS7yXhsXNwbrik3z6T2LWVUN6j87kUv1ZOtMqppzO8ucb8x8
         Ele7BFLjvEciKAJWgcktQg4sTYwvCbExLAje8gxyVKU9U1l9i1awXQ8Hu7ykPHYJkeWA
         TazoS5G1ILu7bvEfuCGbHg/B01A+m7nCy0Zhx/ft8Pu8M0YMkUliMrV8U7Ph4sthLCBr
         M4DQ==
X-Forwarded-Encrypted: i=1; AKwUvByM0Aw2unHYLul230zC2IvZ15zFJP4d3K+evcnMF6oX0YsUScDOek8a71hXNPQsojgtgiVQEIBl0w2E@lists.linux.dev
X-Gm-Message-State: AFq9FYLjEVoWmYG/Vb/XZF697VQYubghG1aLkaSqhNJLk5kfcrc50qzd
	KT38S83u62uDJn7MJCHG0Hc4+NLqdB1IiAevbdhW6lBWz4xGLTDezOTj5fpA0Xl1beOZ4UQZGuj
	CEjGuSaLWOr8LiZIvzqj8V3LIuBKolGqOI026EsI0
X-Gm-Gg: AYBFou030Xt1vHM42pAcnprFl4j9IkmQkjuFwMish+mui7NdosSgJhM4ToZhH1+1ZO5
	gOaymQJ7RgDC0vuaMEh68b4uwKz2LtHOs1cgR3THBhH8Ez+9cY5cYTZ0eUyTYOtczF5LJMRfWz1
	kU5C88MtH8UvyT0p4qYh3am5gZ8843GVjPbtKP+wB1LLAmoEFf1wjeBvkX2PWZwOxMEy+doJLXe
	Iy66LZ3xqtC/s0fC6iun6LwWzZnSTIKkdOuXcsbYGPtIUvJYOtEMjp88fIePpbg0DzDgKwHivgT
	1k+aHsSjQ+XRaGsbOlJFV0ahLZErBZatPwyf2cbayQT+XPy58GLHP4pkgyqXC+Eplh4PC3r/Kpw
	L1M7s4IeRxgQJS3xnvI8skWrF
X-Received: by 2002:a05:6512:1c9:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5bbe0806600mr67600e87.12.1790936433781; Fri, 02 Oct 2026
 03:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-11-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-11-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 11:19:57 +0100
X-Gm-Features: AclHuK9rOT56mg_GDAS-UKmKKcU8gCHcSak7k76HWhpeBX7f_dB7iE1PChHGrcQ
Message-ID: <CA+EHjTxCfmOqiJzYDZHunSuEyoZCbgHuzeSYC8y71Re+9PA6Kw@mail.gmail.com>
Subject: Re: [PATCH v21 10/23] KVM: arm64: Add VM specific callback for S2 MMU operations
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Thu, 01 Oct 2026 22:06:50 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.

The rows only differ where the base already branches (the pKVM TLB
flushes, the protected VM age and unmap, and from patch 12 its abort),
so the case for the table rests on the Realm row, which isn't
functional until the RMI backend lands. Beyond the flushes in patch
16, which operations do you expect it to override?

[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
>  int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
[...]
> +       if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
> +               return 1;

Every row sets it today, but returning 1 falls back to
KVM_REQ_TLB_FLUSH, which arm64 doesn't handle, so nothing would be
flushed. Could vm_flush_remote_tlbs be mandatory, checked in
kvm_vm_init_vm_s2_ops()?

Cheers,
/fuad
