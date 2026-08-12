Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323C945199D
	for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541718; cv=pass; b=QFfVYXJX5A0vgfoCwJOsdiG7VhghDQAAd+XgTojleK9WWDJb8YZgSR0v1ywxPnx82R3zc0povvM+gwf50FXxGYPeACKgu5u4xnskPPEJPfomkQ+VmTp9EQH/gNSGomVBQrVNzNjNZnYEOIQqVpcjV3WJfZKXnFzqhU39OQfdmKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541718; c=relaxed/simple;
	bh=Qd0DA5nheV/pXBjB/+20R2YQSj6wjwSeW68i3S2Fko4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhigkliLDQG6LDIqpDjPc3UD/2poMquI8xzqs4w0mz2IhEgi46Njn4GAcI3ryAjoL51HgcSEFqH/73dbbMca2tc5d9yz2LRSORP8ofWEC7mEIROXcWyYZlBckTTDo9Dfd7VL+a02qz82hN2/4Pjt6dCU0056/4FxBs1frbbzob0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rK5z05Gw; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rK5z05Gw"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c15a5b265so228031cf.0
        for <linux-coco@lists.linux.dev>; Wed, 12 Aug 2026 06:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786541710; cv=none;
        d=google.com; s=arc-20260327;
        b=ICgu4PLOqrR7MG5O9pXkU6sgDW1rYmxTE3i0X55cqgv9s8uPshlAm5lhj12dfPE3mO
         Mj6+/BNbQ8Q2oEdZqc2yHETfd6BSHpo53WDBsI8TmD1GRwzBI6lVXhdT29nxF7kna8m0
         EKPlufrVOYqtKPONGYAizMmgfwlq/QMVBk5Y6940+Oz+aCjmHyCl7Famhq9Z/v/F+XtP
         djkAWwU4WLmQDQ9WETo/6YWL2+T4I4X83PR5MBvhU0bLapYs3myg+Ruq7cngi6t6/gG3
         SEOruKUIsh+FVAqCHoo4TgeDe0kD6dRMmPL26FhyBJvaX4XQRhh7MFy05FlWWwP7KZOW
         Onsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=btatRIN/qVx6m6u+kKi9+q5rHWXBFe/go9/mpyrKKkA=;
        fh=wU1QV2ikxTLnBlh3WPudaIlP882qWtppV8lYNVs2iMI=;
        b=Pkev53LVtz4wHk2RBqtJaiA5PHgYNXXsGkqlydwqERe9Rv86vrolh9MpYU6ix941bO
         vAnG23+/Y7yrhyCnRpuOd3V4XsMLYqbQwxa8cwfnJlgXav6vuZkU7U5Cj5Y52qs9Paau
         fQAq5UzsI8cSi0wm1tmFpxB2PWJbxVv/AQnw1uXlzP+HPH5GGgbXFZjNCMM2oBYH9j62
         WM1NsUD5H9/3w1euOGUWUC+wFljtyBrf83kB3KJRkhE+dSw+VLaRKS0rqDhUTVwwfDvU
         rFsNryZTffD0fH24NGxTPzNtnaBn6tpaOoWZSAL0aJRGldDHgybRNpu0e+t/Sl7in56L
         ENpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786541710; x=1787146510; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btatRIN/qVx6m6u+kKi9+q5rHWXBFe/go9/mpyrKKkA=;
        b=rK5z05GwigfSlNhyqEmZ3iHHPvlDpHpr+wWAoA6gi352CGTydGg723bRXliTmlZwuR
         zaGc1E4Glm1//7VS5EKIorSYzwV+VMKuSQPh6thiQ9XCsoMXnUiLeWFdag/9yuMTGbAP
         UrF1oERZQ34Z1t3y3o/ijU0k8WA/ULwpgusJ/3wP0TMn7zKR/hlihRmYwa8MV8V6CAnp
         jANcO0ERriuXrOt4E+Rxnf0qcL3eCUUYaaComBKvaZZJKdFwSEazB5ohWmmu0Ibi44ea
         0+qTpX9qT1gNQ4wGt6IeEF7bFrHiyg9tM5JF2esPP1CsncnUqyxyboagWzWNXhdZ/vC6
         32+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541710; x=1787146510;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=btatRIN/qVx6m6u+kKi9+q5rHWXBFe/go9/mpyrKKkA=;
        b=ZVpVo6HIYoUphL2vUNLNJEJ6TGNxXs33N0AYtHGyDRawBjRStk3npmQmYwzvaQfdqG
         UDjGkc/hGR3ZbC8ajOHTvLzLDTaJEx9wNas58qa4BNtfAz7spEhlqjSyrkyuPJpxs2Pi
         EfheqljPyylR6dmWFtCX/PxFUgzElKq28nvk9VD9eyj32GOuJTYfgzgSWsDw4m/C8G77
         dkc1snq4Zmw3ULWz/eTRZhBB3djE4twx/uns4UAH02XvL8n+IRqEVQvZMdhJ3j40OQkk
         nr0Abq1Jr472voTozrOIEuyOmnEv0trW6Mm1Ip1mS8UZNozYbzuLr6ziGA1Pm9zsyIJi
         ++NQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXuf9s80sBioIkjwAp/8767Z1WrqJmy/L/ghkd828MR2dvzJN9zvERXylc4goVSIgx2ZRmkjYbIN49@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4uIWixVSnd2j5dWtIGMTAspmKaoZ2NPvk3SHhT8b8NJ+3/SI+
	VXHwcAC1o72tRqTShiG52/NKYn36/64gRb8lWMvjiYk9tZhHi7uzBAgAeW4l88/F9O45/u3zG0m
	TpycBfSbpKHECFuvws7ukvsbgjgzNkXv8lpYXT5iC
X-Gm-Gg: AR+sD11RC/q9d6JUeJ1a/CYHZjsFHkfnDPisR3869GJA3MaxlhLHs5LsQ9zf9aRMS8m
	OqJsFqBQkPD+/TberRflLwSOIwTNnhZhRPBXkiTYh10OrO3gj9an0Rg/NTKvdrORhzr0Wm7WnBw
	CTsrCCNPIWdB2kCuMso/YY5838c/UeLutDt8Aa/X/W0fOTO3vksxAkHyWXBoI3UqK/BuSWBecBb
	q3XgXJM95wKxJ2vuZi9DutjVIAas7l6Yydavz7LuU9IXvz1pd2KyE31SC/AuKOib2ThnCYiMwQ1
	TyybJwFQ8C4if9dcY3F7eksHel4bVWxtRara1ynBBAcRtQ==
X-Received: by 2002:a05:622a:e198:10b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52d65464646mr13714571cf.1.1786541709957; Wed, 12 Aug 2026
 06:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com> <20260807-gmem-inplace-conversion-v10-1-2fc18ee6d3ba@google.com>
In-Reply-To: <20260807-gmem-inplace-conversion-v10-1-2fc18ee6d3ba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 12 Aug 2026 15:34:32 +0200
X-Gm-Features: AUfX_mzDGNX5m7h-J9AcKRPzqX1cpxh6BaIQgAnDEV-ghyjmfpFsGGynIKZZ1iE
Message-ID: <CA+EHjTzkOQD0YddPUs=2=yThG6s3=jQR2xwm+CeAedjyFaANZA@mail.gmail.com>
Subject: Re: [PATCH v10 01/41] KVM: guest_memfd: Use kvm_mem_is_private() when
 populating guest_memfd memory
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Aug 2026 at 23:52, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Using kvm_mem_is_private() when populating guest_memfd instead of using an
> open coded equivalent.  In addition to simplifying the populate code *now*,
> this avoids the need to provide a range-based gmem lookup API in the future
> as well.
>
> No functional change intended.
>
> Suggested-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b596486d184ca..a11cf6dc785da 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -811,9 +811,7 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>
>         folio_unlock(folio);
>
> -       if (!kvm_range_has_memory_attributes(kvm, gfn, gfn + 1,
> -                                            KVM_MEMORY_ATTRIBUTE_PRIVATE,
> -                                            KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
> +       if (!kvm_mem_is_private(kvm, gfn)) {
>                 ret = -EINVAL;
>                 goto out_put_folio;
>         }
>
> --
> 2.55.0.654.g21b8a5bc05-goog
>
>
