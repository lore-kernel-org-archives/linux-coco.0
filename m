Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506E5384CDD
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377257; cv=pass; b=O4f90FTIRtakKUSvD40kZN6wwdJVYH63zuNFifdDA9GljQ3H4dL2IYoFcBmw+XxsjPheKh+voZz1eFBZL7+fV3Fpk6RpRrf4xFMwj5/vTvrwqP3jqado8rwO3NspXrrUmMcEJEAAGWw1SdizTS3ahQspqY59TjUkxX1jOTvtU4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377257; c=relaxed/simple;
	bh=rcYaGj7kmNHFT5KlkfLFAP87Gtcx0zYbs6pHF/7fSTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uqm6U+sSMy8UtHLy0hZoKtTDilkUOqGlwZN5RCpiOkUW4Oc7fEOWh3gvgfYyT+D32zwSxAAawFSDw8JIHw9ex34pdsl00mzYDSivRy7W+r88DwaVokRAl4kr7Q5dcc9GHnmL+pJpCVo17vGKlYWaDTwVyWEHatWyaeupD4lONII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JadADRG9; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JadADRG9"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51765331535so153901cf.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 01:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782377255; cv=none;
        d=google.com; s=arc-20260327;
        b=X/xr6DKtpr0I1P6DIHxK/KzXXPU14EZ8O5NqPx1wLn/aiFIX6bxf/nhjgrlwAkDa42
         Vh3q9lZyWnqg9HSQ87GsRf9EOOgrdwBOjbIrNs7veuLjAksC2E40qrS8RY4W3mIkG5Wl
         GWG/yP2EGkFTPMofXe/whOOQgwQDCaYWfZcTLnbuil3d/oZn2F2oGdye6qfqw/BtVqxN
         Kbnae8LHfT8hjhw9Dy5o9K13BTRp+rfNddt5kDGA/QGNN1/X2KbVJfPxK59P5VkylGLZ
         pqfvcI+pUaNJAhBX2swLCJEYqZhov5E4gjoG8Cr0tR+cw8IGp+bI0VgJ34nWup1m1k/4
         v1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L1P9iL5yW4BU9W6Dd1onnqzvZzuIUKT6XldZibc3Vyw=;
        fh=CS8mLSq84Tw8ZOZ8fwiIexhQGy/MIcWWepodhUgorGg=;
        b=YfdSpbLdp/XpuWXEPsZtqRFI5j4123mWVDE1ly11mXd/1+VL2ZtFd+tiqehx/ZtnSv
         oqCoLOm1712vX7Qi+Gk3p25POkQLLKmQiemRvvIHmBQhEwsDc2rSN/P3Gtqz2AGmZ6O4
         PPfpWz533n1zCxc2pQQT4GwycadCY1QgCnqXHyZmMo9HyyujANoOG9GHTzr03RigdtiE
         KKNiqrs55x5QcBvsDfCG6g9rZdKPnSqrYV3e+pNB2SAIcsBZQsHRF4785BygCYJxdqBz
         uEYr+VsGp1UNNC6hJRvCA4yFdTCT8ov5m/inzCy0nOGnr5enerQCe4sZxKI1PQuem3Ul
         rNgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782377255; x=1782982055; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1P9iL5yW4BU9W6Dd1onnqzvZzuIUKT6XldZibc3Vyw=;
        b=JadADRG9ZVbS90IMPGajv72MOMFGz+tEp1n5v3whDUtMxpw+sNkCZKdVKJykKJSk3J
         bsG+Z50QkhdsY9bLgAwL4LYQhjLA6pcUUTDp+kwT6bD3ozjoc2lZU45Xf7u+lSVR+T3u
         bdDI7v5C/EfRRFV2KtlNhbCiLigqtcm3HMVmf176AhkLrpsws9m8uJdBSGKcYlSuFYXC
         GoTorjIytXJM9v8OBCkpHy/y0tjOxuEaBkofCE2Ce8YJkzZ4leWV2gpkv1GGIyZ+4Jx/
         iiTdKSYMazBT2DscqQFFbm9E9ihiPzNLOG81Rs0AsXFJpx13a9lZLwsXtBOme40yCdjz
         J21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377255; x=1782982055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L1P9iL5yW4BU9W6Dd1onnqzvZzuIUKT6XldZibc3Vyw=;
        b=Xj+Gpta4+pfTFHuiNH5xDhF5HcI781TQAcnBBJNPH7H2TKNodGt8FiLZaWI/RkFBFU
         C24syFheagvaPjqospxNvo5kycS9W8e9utClWa2Ub0+o6Rmueypw7yO/s347GDchNNhW
         40sU/MbpcEjusDqFIsd78FN9midfH85LaT5Ra+bcSixqdcrSAGazMNzdgCk+eFemFlUQ
         T8Tgyb2ouJ9rWQsIPpWth07PTwQOzWWT2T2p/RgSYIqEUBp8SxKfCGSS1zZ+RYyDGsBw
         gFcxStMNJd0XRTPYNQHq7ey008HCB+R+oETLgGM32jUUiDbYKOb72G+LhgmWmugJWwkQ
         6Y/w==
X-Forwarded-Encrypted: i=1; AFNElJ9c6FR84PvCh3MDRcb8yBCTp6qj7K4QeAY1oOwTbE6UOJD8YMuROLNFxH8AN7n4Pq6Ix31Aa29QYsu0@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk3uR+P29by4dcXPc3NsVWa0yYlQiGSAvVb6flFaLznK9Z6hOK
	c0Vi/hwY7yxI4++LMK1NsdgirGWMDdbIDGf77hUvS08NJMLqYEkC898/f2IwAbnHlB8aipmyRDA
	kaEcXK1yaK2Hu2DjgAwhg3A9Wgp3hJkfETZeYk36+
X-Gm-Gg: AfdE7clteoGc1YA6I4OwwbmHSpxYYQ5IUhZEPcFkhWG47ZWKAogaHo6zlm0spQTZu6c
	/HgSbwzrgdAZn24NZ2LWQ/xd38NH1T/CkbxbbyCvbyX+W2LQrUe+wVFtwNRPgkBjMAZPk/W6csZ
	IhZqhcF0KV/+2H3ZDwlXGKrctNeJnDriTp75gaCReMEaquWiLaaY5Ocx1cjD2+lShUPXU617z8R
	10WGi359Q/Nd1z0BuhFXiAOHQpxn8/8lIl8sFcYib+vmh8/RXAW8XecZ8ULvVxjNgC24AmZpKH5
	34vkpCfi
X-Received: by 2002:a05:622a:250c:b0:516:d25f:f038 with SMTP id
 d75a77b69052e-51a6e9b48c8mr8613301cf.10.1782377254458; Thu, 25 Jun 2026
 01:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-40-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-40-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 09:46:57 +0100
X-Gm-Features: AVVi8CfgbrnQMIfXiVsNJJJ0xVsuAP4drBRXl96LSWEK0lsp_b9ZqLBB6cNHuVM
Message-ID: <CA+EHjTxw-28BpsSbPTyuhBEMSzzJa=AWMtrT6Bw=3P+SfBKvLA@mail.gmail.com>
Subject: Re: [PATCH v8 40/46] KVM: selftests: Reset shared memory after hole-punching
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> private_mem_conversions_test used to reset the shared memory that was used
> for the test to an initial pattern at the end of each test iteration. Then,
> it would punch out the pages, which would zero memory.
>
> Without in-place conversion, the resetting would write shared memory, and
> hole-punching will zero private memory, hence resetting the test to the
> state at the beginning of the for loop.
>
> With in-place conversion, resetting writes memory as shared, and
> hole-punching zeroes the same physical memory, hence undoing the reset
> done before the hole punch.
>
> Move the resetting after the hole-punching, and reset the entire
> PER_CPU_DATA_SIZE instead of just the tested range.
>
> With in-place conversion, this zeroes and then resets the same physical
> memory. Without in-place conversion, the private memory is zeroed, and the
> shared memory is reset to init_p.
>
> This is sufficient since at each test stage, the memory is assumed to start
> as shared, and private memory is always assumed to start zeroed. Conversion
> zeroes memory, so the future test stages will work as expected.
>
> Fixes: 43f623f350ce1 ("KVM: selftests: Add x86-only selftest for private memory conversions")
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/x86/private_mem_conversions_test.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> index 861baff201e78..289ad10063fca 100644
> --- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> @@ -202,15 +202,18 @@ static void guest_test_explicit_conversion(u64 base_gpa, bool do_fallocate)
>                 guest_sync_shared(gpa, size, p3, p4);
>                 memcmp_g(gpa, p4, size);
>
> -               /* Reset the shared memory back to the initial pattern. */
> -               memset((void *)gpa, init_p, size);
> -
>                 /*
>                  * Free (via PUNCH_HOLE) *all* private memory so that the next
>                  * iteration starts from a clean slate, e.g. with respect to
>                  * whether or not there are pages/folios in guest_mem.
>                  */
>                 guest_map_shared(base_gpa, PER_CPU_DATA_SIZE, true);
> +
> +               /*
> +                * Hole-punching above zeroed private memory. Reset shared
> +                * memory in preparation for the next GUEST_STAGE.
> +                */
> +               memset((void *)base_gpa, init_p, PER_CPU_DATA_SIZE);
>         }
>  }
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
