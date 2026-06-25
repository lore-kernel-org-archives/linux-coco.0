Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97857373BE7
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379811; cv=pass; b=Tgc17KZsdnprVIgJEJUofQozx4G9kXei/kS/XEd+qr6SiVicJbt1Jri1MnGp07GU2kcq97nC5nE03kjxFRVWArK90KtNoI2Sf386WWyWXiRfg2yxIG8MA/R4onRaWd0I5NJEIOle3Cv15EAjLLAN50QowuKkh7Yx8qF4W3LSq8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379811; c=relaxed/simple;
	bh=WU9qgw2wyQ4Db0YV1GPH6pGz3qYi1wBkaN9pDyH60hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDHcpNiB1mkx0bqcYvBVhwK9RxlkzQpvLBcTx5T4CFm9X2ONmXI2QtFG92B2zMnXVqTZf8amgy3O4KigDFfVGFNlhQ98L3uXIpC5zXE9/BPVa50R9aAxJdCBNK9qLFmVg3ik7A0KnB69yJm/4Ocj/HQlGfBFnrjp3k+Lmp5zeas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B1mOkHGa; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B1mOkHGa"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51765531803so197351cf.0
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 02:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782379808; cv=none;
        d=google.com; s=arc-20260327;
        b=Xo6EcVbjChj0dHB8zUg/FNuQKci0yQmtLACpZ72WFDES3G32d41MHhSVyGyBtx0GPl
         SqcDLxHbhaGAR388eOJv1QlzNu7bbiBh/k4aCKWj9BmmY6tNTbUAOnnu/o1QJBPn54Kn
         YizxXqD9r0S3i1siSV71XNwul++rVoxQu22u0d6e+cmXU8meG4whlGm5cE4fbMLGobwZ
         dphJ0GOFKgNkf84HQjMNIuMyeFOs1IL32hH98njK6KY61nkFB4XsD/xLjE94zD6GkX4i
         jQyP3z6FoaJM9BEVmaAfY8NLoFhWOFWgTWHFUbz1iPZJ+8RjRPltzZGvV/afjQbk8zHw
         KzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HWFN45t67ilSUVNbHIGobHGAf81p04HluCZmKDev2qM=;
        fh=ANgFLGVUiyCDzDF+09peDJVp0DNgFYN1aq3A0V/Jghs=;
        b=fwl4x2P1oa4YkMsf2LGzE+5BtvmQZpkcORGzCfI4HmLTv09c0M49urzg3WQLt3l7eK
         VsQKnoiVHDo3hoFWCJxg4Ij19i6OWnap/tbbiGnnQ0uytxFHKj5BHX83gd051/z0l17N
         UvXe2wqV91mFEDoBBC8llJwvMB0j341Y3/3bgRm2/Y2K5QOPqy6KVhi+QVxhIw6TiMgL
         9XLy2FxdZPgfP3fohKrxax1FwxlegaXLSDgYbDXSRJQwABZn6Rwdzg6iuvKlBYmgFa8c
         o3Y5pcbYBRCNW5Z4v3KKqED3WYc7yEq9Tvm5U4sUuVH/0MJZbpdznXffHpWf6a5baeUk
         SvWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782379808; x=1782984608; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWFN45t67ilSUVNbHIGobHGAf81p04HluCZmKDev2qM=;
        b=B1mOkHGaVPGw54ilf2sCOA9q2GUEt2z1XOrzKanJFiGLAnlV9GBw5gnBBkkOq02HLI
         NUUPzRpMBWvBP9/YhV/8KFc4djkCnV4mPTxyNKZ2f5G/DfOVgzsvHzDpzwZKzwnV1DHT
         5TyvLFzjB4cjZsDCEEmd6Yk7W9N21EylHqBZo7zw8D1AK8Nw9PmHcMN5AG9B/KO6OmqR
         HsgQyenRHwf29d7ZWoyv1UeLbPqDoHSLSyxGS+U7JU3CT/HB5cxAeOrBPdfydSGGCJVq
         fjF9tavpGftOwO+jMTZ66XipWfOf/9A4h/t1WOX5E4ySoKZTYaJXdOZmooINmlbMO7qT
         jIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379808; x=1782984608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HWFN45t67ilSUVNbHIGobHGAf81p04HluCZmKDev2qM=;
        b=VTvQ7JA2u+yCs8O6wvAxoTBflkcT14RKDFotDfta271k3tK3eccwK2kcTUyTXsadae
         cnQH75EFUhpYL/7PSZUsz7i/HpeZg4Yth4B9LUljZumJeOqhojRRRAPsJQZBsI0GSSt3
         1aNIvIX1krP1jXDSm+zaifWSG0nd6Drz9vz0p999RyKJ5YRJcbXUnOOPu3t3ZLGb+MSm
         4DnUY7n4P8/cJOuJF0xiWMKxU3Wxs8FJONmNdrvmNQ3Gkdz/tVi+H97t2jVwvM9QAKjM
         wVwFmyqtVqwF1qcrbiGKRm97lJiZNU6eo9+2LVY7taLYYvhy9E9FE3ApL2MrwlgGgDya
         opHA==
X-Forwarded-Encrypted: i=1; AFNElJ/3uAH5dGEzv35BNCc4pTGp0nTMilUOsKKMhn3ITfs2tcWiqQxuSeWiRqOK7X/vONdl+Qkm8we+OaV4@lists.linux.dev
X-Gm-Message-State: AOJu0Yxut+k2sW147/fVLcg+HCrJqoNoEYlLpcdj/vaWm9mKFDU4mOoJ
	59E64lprxCoW1KET3vj0VJQrctQIncrmgpc9igXKJs5FRF+L/ghykhPT6/1X2OfBTCdHFiWZZ50
	1He0Y+stM7nbxNbOyr15NVBpR2Lk8cz6+ZJhGDkJ6
X-Gm-Gg: AfdE7cn5wW4nROMxFonZX1l2MNh8bnaO6PPHNWfwJlhLkSot9n8t6FOfJKMZ99sKJ/c
	AYB9S79NRhIPdEHmpT6AnHbiiWhnMw75BQ7hdT8jDw1T8rbqGhmQclb3ZJOd/DeCg6TAsSxyj2k
	oGGaHQGwDrTN2f8SBXwRzdtyyUpNfamsxTVd5yO86Qja0cd5s4oGINQmrWDftT8QEQDVhK9gJ4n
	ipcd9qNGQEsFZ1dZJV2miHP+uZ1lIwX2UjTrSKxzQ6c1/xncCEJQTQqTDOpdAKdbS5s1N92pA==
X-Received: by 2002:a05:622a:228a:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-51a6e9a113bmr7270171cf.10.1782379807934; Thu, 25 Jun 2026
 02:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-44-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-44-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 10:30:00 +0100
X-Gm-Features: AVVi8CepKPjvM3Enq6RbicrK2LVKri7rowcdAQD9hRsLWhakG_kPU-ncpztrsII
Message-ID: <CA+EHjTzL4yfp2mUqE+_FdoDLVGdpdh8Gy+gAwe3FvLWXwkOFog@mail.gmail.com>
Subject: Re: [PATCH v8 44/46] KVM: selftests: Make TEST_EXPECT_SIGBUS thread-safe
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
> The TEST_EXPECT_SIGBUS macro is not thread-safe as it uses a global
> sigjmp_buf and installs a global SIGBUS signal handler. If multiple threads
> execute the macro concurrently, they will race on installing the signal
> handler and stomp on other threads' jump buffers, leading to incorrect test
> behavior.
>
> Make TEST_EXPECT_SIGBUS thread-safe with the following changes:
>
> Share the KVM tests' global signal handler. sigaction() applies to all
> threads; without sharing a global signal handler, one thread may have
> removed the signal handler that another thread added, hence leading to
> unexpected signals.
>
> The alternative of layering signal handlers was considered, but calling
> sigaction() within TEST_EXPECT_SIGBUS() necessarily creates a race. To
> avoid adding new setup and teardown routines to do sigaction() and keep
> usage of TEST_EXPECT_SIGBUS() simple, share the KVM tests' global signal
> handler.
>
> Opportunistically rename report_unexpected_signal to
> catchall_signal_handler.
>
> To continue to only expect SIGBUS within specific regions of code, use a
> thread-specific variable, expecting_sigbus, to replace installing and
> removing signal handlers.
>
> Make the execution environment for the thread, sigjmp_buf, a
> thread-specific variable.
>
> As part of TEST_EXPECT_SIGBUS(), assert the prerequisite for this setup,
> that the current signal handler is the catchall_signal_handler.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/test_util.h | 32 +++++++++++++------------
>  tools/testing/selftests/kvm/lib/kvm_util.c      | 18 ++++++++++----
>  tools/testing/selftests/kvm/lib/test_util.c     |  7 ------
>  3 files changed, 30 insertions(+), 27 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
> index 51287fac8138a..bd75162ec868d 100644
> --- a/tools/testing/selftests/kvm/include/test_util.h
> +++ b/tools/testing/selftests/kvm/include/test_util.h
> @@ -82,21 +82,23 @@ do {                                                                        \
>         __builtin_unreachable(); \
>  } while (0)
>
> -extern sigjmp_buf expect_sigbus_jmpbuf;
> -void expect_sigbus_handler(int signum);
> -
> -#define TEST_EXPECT_SIGBUS(action)                                             \
> -do {                                                                           \
> -       struct sigaction sa_old, sa_new = {                                     \
> -               .sa_handler = expect_sigbus_handler,                            \
> -       };                                                                      \
> -                                                                               \
> -       sigaction(SIGBUS, &sa_new, &sa_old);                                    \
> -       if (sigsetjmp(expect_sigbus_jmpbuf, 1) == 0) {                          \
> -               action;                                                         \
> -               TEST_FAIL("'%s' should have triggered SIGBUS", #action);        \
> -       }                                                                       \
> -       sigaction(SIGBUS, &sa_old, NULL);                                       \
> +extern __thread sigjmp_buf expect_sigbus_jmpbuf;
> +extern __thread volatile sig_atomic_t expecting_sigbus;
> +extern void catchall_signal_handler(int signum);
> +
> +#define TEST_EXPECT_SIGBUS(action)                                     \
> +do {                                                                   \
> +       struct sigaction __sa = {};                                     \
> +                                                                       \
> +       TEST_ASSERT_EQ(sigaction(SIGBUS, NULL, &__sa), 0);              \
> +       TEST_ASSERT_EQ(__sa.sa_handler, &catchall_signal_handler);      \
> +                                                                       \
> +       expecting_sigbus = true;                                        \
> +       if (sigsetjmp(expect_sigbus_jmpbuf, 1) == 0) {                  \
> +               action;                                                 \
> +               TEST_FAIL("'%s' should have triggered SIGBUS", #action);\
> +       }                                                               \
> +       expecting_sigbus = false;                                       \
>  } while (0)
>
>  size_t parse_size(const char *size);
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 6b304e8a0e0d5..b4f104436875b 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2292,13 +2292,20 @@ __weak void kvm_selftest_arch_init(void)
>  {
>  }
>
> -static void report_unexpected_signal(int signum)
> +__thread sigjmp_buf expect_sigbus_jmpbuf;
> +__thread volatile sig_atomic_t expecting_sigbus;
> +
> +void catchall_signal_handler(int signum)
>  {
> +       switch (signum) {
> +       case SIGBUS: {
> +               if (expecting_sigbus)
> +                       siglongjmp(expect_sigbus_jmpbuf, 1);
> +
> +               TEST_FAIL("Unexpected SIGBUS (%d)\n", signum);
> +       }
>  #define KVM_CASE_SIGNUM(sig)                                   \
>         case sig: TEST_FAIL("Unexpected " #sig " (%d)\n", signum)
> -
> -       switch (signum) {
> -       KVM_CASE_SIGNUM(SIGBUS);
>         KVM_CASE_SIGNUM(SIGSEGV);
>         KVM_CASE_SIGNUM(SIGILL);
>         KVM_CASE_SIGNUM(SIGFPE);
> @@ -2310,12 +2317,13 @@ static void report_unexpected_signal(int signum)
>  void __attribute((constructor)) kvm_selftest_init(void)
>  {
>         struct sigaction sig_sa = {
> -               .sa_handler = report_unexpected_signal,
> +               .sa_handler = catchall_signal_handler,
>         };
>
>         /* Tell stdout not to buffer its content. */
>         setbuf(stdout, NULL);
>
> +       expecting_sigbus = false;
>         sigaction(SIGBUS, &sig_sa, NULL);
>         sigaction(SIGSEGV, &sig_sa, NULL);
>         sigaction(SIGILL, &sig_sa, NULL);
> diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
> index bab1bd2b775b6..30eb701e4becd 100644
> --- a/tools/testing/selftests/kvm/lib/test_util.c
> +++ b/tools/testing/selftests/kvm/lib/test_util.c
> @@ -18,13 +18,6 @@
>
>  #include "test_util.h"
>
> -sigjmp_buf expect_sigbus_jmpbuf;
> -
> -void __attribute__((used)) expect_sigbus_handler(int signum)
> -{
> -       siglongjmp(expect_sigbus_jmpbuf, 1);
> -}
> -
>  /*
>   * Random number generator that is usable from guest code. This is the
>   * Park-Miller LCG using standard constants.
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
