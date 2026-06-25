Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4660E3749FD
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 07:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371032; cv=pass; b=h8bFsR4AxAmTg7f40nT0+NtJXpNXkLhyrJHJnGI1T4Eg3PGVEOaftor3XH/Rm1VAHqEdlj8S3+/IQYBfpHAmg4y0BGdm9wG2ut7G69vg/ZYV7SPs1zSy/lJruVkvfqQ6STrOeIws+aLGm5nV3TBhIcWoh4DUQQni4VEqihNBOaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371032; c=relaxed/simple;
	bh=Ez7Zm7P1hEGa0blOb+96zp9ELCwRYL924NP/R/74yK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJeoz2idZ78+jRHHmwUcpmkhkMi3m0Jkq/vVAV6IJw2EqFxDbzmmQpbmEV/GDatfp/ztl0i+sE935r7fbBqIVtFz6QR6voI1pqK+xGeJGWsc+Kf/10eD+sgYVIr5VJcotOVnu0VlXCr5SyCQWFN+ThJSAN6IHj54YKAqeAF0OHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=teelC050; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="teelC050"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5177d1ff061so135541cf.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 00:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782371030; cv=none;
        d=google.com; s=arc-20260327;
        b=DHn+cgvW/LtleJRp2cTBtWT3BI/xrv4uofN6fDu8tjU8cVxm+VX0j45O6hX2aMDGMm
         zMDrQo8DyNB3kZdXRqkcFQumWuXNh+vaTkzMqMunJrZFYvry7SLds0lRq1/e8yX1Nr04
         62yYjeVXE2FIhCiRb/8yi4qTyaZdAYjJaR8pR8iWhKDlEWNhNp01FoaBIUo8rme5efx2
         e+nwvccbawzq/t6UpHcOyykbjGtJEhCzrfOArJPG31DtwTrB8EqLYZPqKdaQQNsYYdZT
         ojJ0f3tOG/yBQJFYzaS/6GZPXa/H+y1XSxmpJngdPHr0I2ylU17gBCknV4QGkA/Bliax
         ZYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cxrlZg8b53cTZGaXTuMmmJujU2vJAW9nQq1QLfM1210=;
        fh=FQNZa9lPr491gkXEDI7nQsgyDv/dTg79gbPAyjVaokA=;
        b=h35LNC/IgPm3ixfYiooJgL7RBP3K+68yL+0M7bqRmLwmEO84G36YOVezStTGln4Fjq
         +Zp2R5m9wExqJl58mhSfm3HbpSFwW+ekIIj4xDSF5m2pFdC6CzLiq3YVm8KaVSvFmz3F
         y1ZsKu8D8PdqLiP+99tyCBlYtapRidh1xUYUkmpSv7gtV8oJCl/KXY0Ts09ii6sxNf6Y
         Np58Qc/SwCMj3vu9cidEgMC6Cgc9o0uiPsUyj5b44IGLHzdW1aND0G5H8NmRtnRLyi/d
         qfVB7wFyjMJl0/uMnloBlsqNCKT46FJTulWvvZvaOsK0gxBauAV1wykfXMVcjGx5zUA2
         7hLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782371030; x=1782975830; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxrlZg8b53cTZGaXTuMmmJujU2vJAW9nQq1QLfM1210=;
        b=teelC050uGNdc76JxVpUgaXT8OSWu8u9qFu2zD5+k7dpuxeaRbL+YjpHO2ovdcG6Kw
         glygHVhLffVAUj9jsyRjeQYlPgAOPdhXAEfAcKYaDQHvy+SUQCFPye4ihtpV+X35QSLC
         GLUZOTuuG/jGshZHG749tvj9NWJOvsBdfnHIhEAd6usAB5n+WIAMDwOAO1oHtpgrJYxX
         ApkkD5RiTW513xfzubC3NVdIw5yMpeNJgMX7oAkcq+mc/MSyNTVqxM/aXr6WFMUgtlAE
         yyoFu8JB/ake1KJo6IWaM6QerHOI6/OHsBuX25iHI9E4dBT5WiD6UmCjcKtPHnNAVFsi
         lPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371030; x=1782975830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cxrlZg8b53cTZGaXTuMmmJujU2vJAW9nQq1QLfM1210=;
        b=TP4PPrnjGZrzG5QWxuFFPN6l/2uHOrjYPHHgjClIcUhP9iO7AAGzW2/LjL1muEqcj0
         LRee2K1Zye6wTZP2/e6c9IGqt8V5avuEkhFOesYRfMRB17LiuHQVkQ2XUw0IHriNfeqN
         EoVbky97EDksn114pHgBM7HQPOPV5fpsT0GXQdg6ngA0soRD//lBvYA+FgoXE1A+rFD/
         ovR8Kdr1ZWZsXhBIFtW3cDnuap6yzjmVNHUIFKn1jFT6jeA0HcoFY63o4J80XbTb+uZu
         GU8dJXD2NAXqRgDbCYJS0Lm2iigt0lY5hMwZGgfsMmm3OxBD2F3KE7MbmrKSK1p3m1+c
         Eotw==
X-Forwarded-Encrypted: i=1; AFNElJ/9u5vTZK/SR18hO5o+qQIHRmyzt9xyEbg5GiPqfaM2PiJx5MmL4RCVR1yxSXWtH1pjUIRmLn+Zgjhf@lists.linux.dev
X-Gm-Message-State: AOJu0YzV/F1Oeusgvj8t7DpbzZmUOgG+ee5LS+jUCCQqLyz1U3JR1WbD
	Ytm9WdmemlfV2hCF4Au04GCUldOGzqDyElh+phTXY2yKoABt4RV5mmSEePRpQEbQILRUF9UaY5a
	6fkRCdmx9bmovHwHWU6E6g+ILsg0JnXYUEtUCOJL6
X-Gm-Gg: AfdE7cnlKaJJUNZu/4xU0izu5iSxSU2qI6OSVS68NVlhBtpId92B1wMburoMB0uRqw0
	aYO4l7G3oyN6UxBN3C4SptbKBsgkBFr2dJxm/3ieDwPv8mXYbWraNepUSib9d4vaWGaVkdV59lP
	971+shdQXWrb0qRd4lvcj3cKA4Kf4UfGKl+YUFEtXQk4hBy8jfwTH+p5bSXFpSujbGznz5M3//+
	o58D8dPE/LvMOX5VBXSi5aDFxzctNXmSrgw5uTkAGvZOaJKjyqojRvtgPaGvWJ5L/9eYaj9aQ==
X-Received: by 2002:ac8:5913:0:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-51a709566ddmr4167481cf.7.1782371029299; Thu, 25 Jun 2026
 00:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-35-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-35-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 08:03:12 +0100
X-Gm-Features: AVVi8Ccml7uePn0yWr7psf-IlIIJeOhhOzFV38YDt7BElEVA1ysUJR_9AnFc0ro
Message-ID: <CA+EHjTynteewQUd4VTobSypO=oFObYSBLZ_xyK-CGNSRNcrViQ@mail.gmail.com>
Subject: Re: [PATCH v8 35/46] KVM: selftests: Convert with allocated folios in
 different layouts
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
> Add a guest_memfd selftest to verify that memory conversions work
> correctly with allocated folios in different layouts.
>
> By iterating through which pages are initially faulted, the test covers
> various layouts of contiguous allocated and unallocated regions, exercising
> conversion with different range layouts.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../kvm/x86/guest_memfd_conversions_test.c         | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index b43ac196330f1..0b024fb7227f0 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -279,6 +279,36 @@ GMEM_CONVERSION_TEST_INIT_PRIVATE(before_allocation_private)
>         test_convert_to_shared(t, 0, 0, 'A', 'B');
>  }
>
> +/*
> + * Test that when some of the folios in the conversion range are allocated,
> + * conversion requests are handled correctly in guest_memfd.  Vary the ranges
> + * allocated before conversion, using test_page, to cover various layouts of
> + * contiguous allocated and unallocated regions.
> + */
> +GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(unallocated_folios, 8)
> +{
> +       const int second_page_to_fault = 4;
> +       int i;
> +
> +       /*
> +        * Fault 2 of the pages to test filemap range operations except when
> +        * test_page == second_page_to_fault.
> +        */
> +       host_do_rmw(t->mem, test_page, 0, 'A');
> +       if (test_page != second_page_to_fault)
> +               host_do_rmw(t->mem, second_page_to_fault, 0, 'A');
> +
> +       gmem_set_private(t->gmem_fd, 0, nr_pages * page_size);
> +       for (i = 0; i < nr_pages; ++i) {
> +               char expected = (i == test_page || i == second_page_to_fault) ? 'A' : 0;
> +
> +               test_private(t, i, expected, 'B');
> +       }
> +
> +       for (i = 0; i < nr_pages; ++i)
> +               test_convert_to_shared(t, i, 'B', 'C', 'D');
> +}
> +
>  int main(int argc, char *argv[])
>  {
>         TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
