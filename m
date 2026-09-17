Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844214D0CF0
	for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646189; cv=pass; b=UkaV4AyyeD6Xg0ARWrcChhVH4IQMDcy2TenE1XYgROpnMMpPHBX+C50N2NF9QCcClwn05hnYnKYHnMnyCquOBW+ue/WPMGd7fRiBaWNm8LtGmYhfNjl5mOTbJ1yA5MCFIHObhAQtSDgP1OjzFjWHsSSnMYx8SqnCzrQd+BFeWZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646189; c=relaxed/simple;
	bh=CU3ksfEGHWdCIaQTH2LQ60wY6nLY7ierlfjMVdlARvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVMdTYYtKtD8+5dYxcfQU0IYM1Sif+tPAFmr2NGvd+1yFmP/IAraXncYwNVtlTj6YIJ8sCvxpKqaw84vAFn41ctDrKNNMnUfT/Kqke4UTp6LVKmBY8EjjLhwi1dUKmKOCR7ScnRP4x9X9BAqEisZst0GB0GiwuzqO9alDhHo9j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LidfLsuJ; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LidfLsuJ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so1093e87.1
        for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 04:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789646172; cv=none;
        d=google.com; s=arc-20260327;
        b=WZi60flwtLvzg09kURfvLTMzZ2S1zdOrEjhO4M1O+XmqRLspQtlfRURpg0g2ILFtzI
         qExzG3so6WcJDVou+MQeDX06HJz4SsZDHQyqkUWGI/sGZh0Mgv7jnj3vlhmzMt/Jn2zS
         vCn8X7GiiZTCH8wJeWO8fo0z4knUxHaB1NWZCi9cf9jiBYZlefX+4sflDjP5gzkQomBb
         pKNRakMRZBRE8i/gteZaWNIfHhoF+FsJcVrWVDmM7LaBpiDFedfe92uGcRSFkDApN29r
         aciFfIPfdoopbIO5voTuX5mftPCioqrSShOR/9Gn2fd4EE++iepvOG9Ef75KiQTraDP+
         9dLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kosCb2yMfsMu2L7rZnHgF6oeDYnJPHYiEzUWC4os9nk=;
        fh=2a8BaApHgjNKI3xKZwdUejNINxOaDSEv12ee2zsF3IE=;
        b=M3JMSzFl1c76ljOEed+JaIhv2AkWE+3ha9B0x3TSqbeJzljmXIT9Gi63P2rvJ8LNNa
         QhHMxKQgUZXXgvi3997GkakOZD0b2SaFUu9CumUOdehCvbHwbKgkLwmpdwaxq8Q3nFFZ
         ON9EyXI2g+fUEqAv1KXlxIFbuj21F5ATO+7CSLBXsh3bnQ2NgireE77h0kL0I3mdAaRQ
         hAHLpZB+VGXHOaekaHO0i5oC84D2x2iQFJidoXuljMXW+2soVJO0oYWGmWuPKgdb7b3n
         d+gsDacASfOh2BE4eVkvBMBMqF4Ev0JQfpjmhSggmBWvKKhOoWSEzqw91vbwC1SH1gXY
         RNMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789646172; x=1790250972; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kosCb2yMfsMu2L7rZnHgF6oeDYnJPHYiEzUWC4os9nk=;
        b=LidfLsuJgtKMx7jIDCfWwJbq1hmRgrb4R95uAGWHGBh/IkpLl538JsxmWWONHrezfc
         WhT0BWDr6hALHGEO2LHWyftyZzWPrI5PbqP2mCfL9nXrek/G2Z/JAq5kpQG7TGlIlpL+
         3VQV6Kjw2iyOdbIgNMnZ/zuCcHPzJRT2ZUpIU8jQtJueKGarR0q4ugPULLhOesastyqK
         6lRdY0/04RCRBFufvZudZVcSqm5ZfaD2qXnWpTYsBLshMU1VCa6NFDiyPDoLchTzlfuI
         qxlLjeHYDCM5zjMsAXfZqVD7ixCodX12EGyeEOB2+yzoDrGkm4PByBT3IT0fQBIDWKzr
         dcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646172; x=1790250972;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kosCb2yMfsMu2L7rZnHgF6oeDYnJPHYiEzUWC4os9nk=;
        b=TKQ6K1hIHvmBWi6yrRJHmSXdAr9WKLmXtbfF7qYIotwggwmFBzWVOLi2vsHfoi+n8f
         ibjj4o4Pc3dzj7iUWQ/lQOnDm3z6HYdOEaGt11EG0MasUmtRC1WLjZGn3IJ1CfXi8GZP
         +OpDm7l5Fvde/Kmby/bdnXASzqPRV76epIaXZTSMQ/zNyapWd5XubWl6V6EMx7xTmHTF
         ficR7m9Ht8X4V/InaF/0LuFRukJ3qRBcqk54sgBr2dVkNgsyeNw8gq8Ow8Nz0j38nDAr
         1RCHvWo76UpMM3u8Ax9lGXiNbTbyEY9zv1r8Jo3NQlKPElxkNngK6Xi03wc12xWkh9hv
         G3Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzSxctodIHYnKWan0ahIrDBMg+wOU/ZA+QmRfDdYJ67iY8L19cZ4QOBoQ2+0YIDKwT4AVpXZaWrIna0@lists.linux.dev
X-Gm-Message-State: AFuF++ndIv7SDQROVvdzB1TsJjwVCtKdJ4S3B1+obbaSHE+lDXrGy9gM
	f3JCHPHw111Y5HO+cVh2wbgLZ4Q8uHBQ94JlrJMYgPH624BgUuXlauWL8Khgb7BycYRNCljY6XI
	tv8GmTkOggkhISNOM6t/VtqIgGuvTAqqdJPnvhNrU
X-Gm-Gg: AYBFou3+StoFLEs1lA8sw5YzmC3b6zWu0hTZzS78nB9q4oKn9+PQsk6gFUMv12iTCaB
	9eaxbSD0vdd3T8Z9jcpBXaoAGEFGM7HHlhfdP1QdtH0S6glgZ6uscPj0OEwdzXhjqRqMXlZTPzv
	aBFAn3psUJpSAvQmjvQLCJHvdsprXcjbBx+1mkOIncVz/5QnPpAsylXhgZkVzD1oKKgw17H3xpU
	XARaHosgK/MdRD1pxoWo6FlwjbVFdGt4IFNPF2i4PYGO03zTmswSwclGkCgx+L/fM7rHORhgpY/
	q/RuHvxikTc6WxKqeAoD6VJV6+rBIccLrhn1TltA6Wtk6P1D7YqEgRh+iPH4iE5Oe0lrHusVh1I
	RFQVBDsVbw9TK6w==
X-Received: by 2002:a05:6512:686:b0:5b4:74e2:4171 with SMTP id
 2adb3069b0e04-5b8bff1fc30mr29453e87.4.1789646171156; Thu, 17 Sep 2026
 04:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-14-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-14-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 12:55:35 +0100
X-Gm-Features: AcwNN1Und6z4n8NhcdREXtYfkYZKnB08V2Uvzr0E-uhaZeSThY7dario3kxcFlo
Message-ID: <CA+EHjTxe=UXnKR6DzTqL9d6O0aG+rO+nPKTxKKQ_-w6tpkGCVQ@mail.gmail.com>
Subject: Re: [PATCH v18 13/23] KVM: arm64: Add a helper for VMs running on hyp
 that don't trust the host
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Tue, 15 Sep 2026 17:01:31 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
>  enum kvm_arm_vm_flavor {
>          VM_NVHE,
>          VM_VHE,
> +        /* VMs running on a hyp that doesn't trust */
> +        MARKER(__VM_DISTRUSTING_HYP),
>          VM_PKVM,                /* Normal guests on pKVM */
[...]
> +#define kvm_vm_hyp_is_distrusting(kvm)        ((kvm)->arch.vm_flavor > __VM_DISTRUSTING_HYP)

I think this should be `>=`, as in kvm_vm_is_protected(): MARKER()
gives the marker the same value as the enumerator after it, so `>`
leaves out VM_PKVM. As posted, kvm_phys_addr_ioremap() no longer
returns -EPERM for non-protected VMs under pKVM (EL2 still rejects the
mapping, so it's only the errno that changes).

Cheers,
/fuad
