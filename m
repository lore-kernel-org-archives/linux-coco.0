Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF73D6BB5B
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 07:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371072; cv=pass; b=TjqQ1ZQQCPkPnCdNbOIb8qfnlihvezNJCXIkzcvOQg0NDHjbfWXloqONLRMcL5G7YFthI8QhgXvVY6P+e/9I7djgFKnViJLOMlTS7rq8XLjEMzk3w8rnt2N6bgnWAHFDqyGVVy3XKVSU1M5Siv/lrFJesn2MHbnhEH1qeMwbjkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371072; c=relaxed/simple;
	bh=zdplWEMU4ZutyOkbI+3SiQhFO5MjqtwHboLbHuF46t8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYXbrYzok4WeQxanCDOvqO/lukVwd2pVKtpZfZoyJXmzEj7RZU9oO77JHQwkvAzq/o//VTnTwqh3tLDlueccxALRjOU3TLCFiSKnRJOA5/U103Fj9ONV94Tx3Oue2r1vne68iW0iQ0F1+XE39te/hynv4UqjrFsjGZYXZUvAB1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kU08aeYc; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kU08aeYc"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-519ed52bcc6so182621cf.0
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 00:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782371069; cv=none;
        d=google.com; s=arc-20260327;
        b=LffpDLb6cIL+O9xDfHxIk6olOQKZSrgPKVWphaYyHHmLfQ2JXLELRpPrydoc9KZyXm
         GtU0znWIaD9j5Vazj1caEJH715xsy1hkcBOOM9ckCW2DCOTFmI2UAr8H5SyWdyBMg7ar
         LzmF3TgpEy97X48pNivTMzkx61PAHMXL0vCxYwDiuMTwWrRzzMCf45Z0EDr+2G6WuVbp
         EoVh8gpDoY1jA8pUJqkwy41GVK1RIY4Jyn2gKsgQmJngy8c6LVE7GrvYvaxdt4EeyAV9
         8esiBSFX3Thk4MI01uJMIyNibYmf0hJxWCRwdsmODQzHVS7VRyV+uDAiJL/YhvqhSQUM
         Uyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EviLczuyy1yyIrBaIYV/LFmo2BGtZCvU6IS38nnd4b4=;
        fh=cjAEIADf+r2RqiQAzNpZSkpVrTTFHVIYQ3emWWR/nTg=;
        b=cu1pt9OmoRkupcKf4JtQpGjOudoMI1rjfVhfnJ9jBiOzRx5KimVGeAX7l/M0Rjv4tM
         E7JjXxq821pCXJp8bx+kPZqvLhuxNJK6zNEoFCnbYqjzT+0PqhFno+mUtjOI3BWcCNk1
         /hP9cCh7VMFWQiJhx3YyeJ7OoBFGyGma5BHLgRPtD55iBKetwYxPgbkV9imSM/MjFHU5
         w/vzt387nrREN5xONxU19hMZHN1tG1RBI121Ne2UJ25O+ext4XV7o1C+OTNZ7bWDjbi/
         TrQP/YryeFJxQ8t6brdXFeT/nMxZC9kYWqXishPIDNlVjfXlFLljEmGLK6gkZjJUKieX
         /bfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782371069; x=1782975869; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EviLczuyy1yyIrBaIYV/LFmo2BGtZCvU6IS38nnd4b4=;
        b=kU08aeYcEEi4+s788cPbGiELxLGPQuAzEwg3Hfvd8swWjScDwlChT5833YlcnzmPPu
         K1DZ6IYo2EUqKPI8a5L/zZTPNtB7AHm70zfYXiqf0bS2dIb1u7sTgMdig6x6x/7EX/Gl
         cR+aW9V+xplmKXL0TC8cKn/trNIuasJmX4fmnYU8WarTY6ARigvUuc9L7OhtgYv9FoEa
         ULw1ehnBhqJhr4Z606ELnoZIjgpgqE3/rgwuZH6CPk68mA2pMwNOUOia1CcsEQpRkzwy
         RMndTRkz6elisPlHuWmEbGnVbGjsqGkaBxbaexopA1jmEPIJPPUV6Rlhcz2myQYhOwG5
         M7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371069; x=1782975869;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EviLczuyy1yyIrBaIYV/LFmo2BGtZCvU6IS38nnd4b4=;
        b=LPmmPq6hfx/IYEtVZizsZbp1DMehCAZyJZClPLNzy+/F2gr3hJrYIs7BcBMiudsi3K
         Mat0RUFmM7QiJ5EloH+YXhxMFKEfbKc5TDmHt4+uP0JRfFbf/w8IcxqPZ1ubNb7EsuVP
         LhvjXVbuhZh47zh5Vy9gZ6Mu4Uq+Oq9XML57Vg3bnfihw3kmws9RD+yTVCa5CoMXvQ2e
         jw0ZWAsArVoYzcP2Wb6j2yRYWKZMnr+W4UMLIhRDZ5Ykphy4euXTNtpmxz9+dONCiZek
         HuZ+gJExGKjuB8e6ZmFYlV1dTQViIK+ZXDtx664H9xMr1c2e9VlHDmvQI9p0MkxX1JSA
         0xOA==
X-Forwarded-Encrypted: i=1; AFNElJ8wzh+KCIXKO/Y7gsGPXWpwK+BOjTGXa25L1tXuOAQCvVVVpKrusUidWU0iuxLQYpSzr4PnxT/G4B9G@lists.linux.dev
X-Gm-Message-State: AOJu0YwkXxuG8Sfa7bVIjgbXCnv461HhesTofao+mMowwP578fFk0iKq
	cLFkT/59UPGONmNqwxEyfOnBEaCvV2OCdvRV82Po2hsYJ6dh0Bo2e/K3nLd6evtp/LJm1FOO/eL
	0qe2fNgkJ7xD0KEfigMPAVrNSyxwdxOQRIdEerQxY
X-Gm-Gg: AfdE7ckqA/KtdOfHV7I0hNwU/gQeuUAT9CoGOFAhqQnZjO0c6St7BOPwJrWfC6k1YhV
	acCI86JLCSBm3UArvvN3cr+NXjq/ffZ1bTAL/1CmciGJVdInBL1pMurG/G/j29drJpv9ZtB5muf
	Ix9DSPIJ8FTzvMSK+dA9Vpll/9SO4iSSJsIAlCM9zYEAN365oPFN+FpmB1dY+MFPRuG3Zg+Cxin
	YRv0s3Dh76vwHOKirYjj2WgFjJw1FxjMd+ShuznXmoWmaO08eu34bVCH06+m+3Q2insEybTHA==
X-Received: by 2002:ac8:5a88:0:b0:519:b655:235 with SMTP id
 d75a77b69052e-51a703faaaamr4395391cf.3.1782371067208; Thu, 25 Jun 2026
 00:04:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-36-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-36-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 08:03:50 +0100
X-Gm-Features: AVVi8CfPiivQ2jTF4C4b2T4SW03MiAlvIrJh5OdhMlg3bv2FAUX7zsWQXsWcZEs
Message-ID: <CA+EHjTzFUayXCh2SBe7Nwu7YEO3aUmL1Fo1hE_v8OvUw7MWO6w@mail.gmail.com>
Subject: Re: [PATCH v8 36/46] KVM: selftests: Test that truncation does not
 change shared/private status
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
> Add a test to verify that deallocating a page in a guest memfd region via
> fallocate() with FALLOC_FL_PUNCH_HOLE does not alter the shared or private
> status of the corresponding memory range.
>
> When a page backing a guest memfd mapping is deallocated, e.g., by punching
> a hole or truncating the file, and then subsequently faulted back in, the
> new page must inherit the correct shared/private status tracked by
> guest_memfd.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../selftests/kvm/x86/guest_memfd_conversions_test.c       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index 0b024fb7227f0..f03af2c46426f 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -10,6 +10,7 @@
>  #include <linux/sizes.h>
>
>  #include "kvm_util.h"
> +#include "kvm_syscalls.h"
>  #include "kselftest_harness.h"
>  #include "test_util.h"
>  #include "ucall_common.h"
> @@ -309,6 +310,19 @@ GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(unallocated_folios, 8)
>                 test_convert_to_shared(t, i, 'B', 'C', 'D');
>  }
>
> +/* Truncation should not affect shared/private status. */
> +GMEM_CONVERSION_TEST_INIT_SHARED(truncate)
> +{
> +       host_do_rmw(t->mem, 0, 0, 'A');
> +       kvm_fallocate(t->gmem_fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0, page_size);
> +       host_do_rmw(t->mem, 0, 0, 'A');
> +
> +       test_convert_to_private(t, 0, 'A', 'B');
> +
> +       kvm_fallocate(t->gmem_fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0, page_size);
> +       test_private(t, 0, 0, 'A');
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
