Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61282371887
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374756; cv=pass; b=fDI78wFMGta8dISke8AohmIdc36JUGkkRdnIsemOX8rFNzg4C+7GHIXuKxJ3NUfWEDy6cZnFWv/Bmv4EQXnZPRkL2+ut30yIi9INa+yQaBQaGTiBXtclqCcvY7FW4TrNP6IWItiqP/zKY6kRpz1o/l40Fab6JWrakTluLyyqlAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374756; c=relaxed/simple;
	bh=gUH5CYeDQBwLfZeJDBALuowu5eygG91h78hLIiPuwTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUou6h6hUVGabJOPjYaov/iGD+wvqgSxmmppf3fJHREzTTVi+OSy1kLB8CvP1o4yfuk5pAy/YeFzK//n6wYvVRhBwhPe2zSF6XsW91DQo7fF4P0m+YCtcDvNbRGQEQTCn4yPQ0slP5UKPnO9+InlJ3XxfAfTyWQ5MIrduAM0pIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AKTRsCGv; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AKTRsCGv"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51765331535so141301cf.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 01:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782374753; cv=none;
        d=google.com; s=arc-20260327;
        b=Dt0rHosXFbWyqgRn6rYmkwsFrRRJ2stoKXW5J32opdvWNJc5ISXRr/+2QhIFzj9cjY
         5vAs5yAUqajm8eP5fH3J9C+gGfVJG5R7BnpS6hI/AzudXhiSy8AjccDsftaIVQU5asvw
         NK7Q4MPq2QpKpUd8hLRuVYwdEVyxJnbjRklxUn0vClRq3+YtG3Y6Mgx2kvbqTnm+gcSO
         95Mi+2nb9OESZ3asq8sop0Fg0oKvL/ooWT5IwejD/FDsSDHh5yVxFdZczn5XnmRF5xH/
         oHk/iYek36d1pZxcHyAt+K8NEih+gvJTRnWc6WAbiGX6ybsq8WFdB08zp71nrsT72oMf
         jg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9LjtIzZk3vxrXZVAwqdL1YMS08SLuDbLYjQh10VCn/I=;
        fh=7M1wTqNDiaesuF8mKe76WjvON2p0m9PXkos5BJoVRNg=;
        b=gjro1I6ZxYJLFDPLhTTeINMHHfCm42kav6uuh9JuErwXRYs/f4LArpynykuqy4niGn
         d4opSRaq1+ku9QGPTnT37P1krSC/VqpEVVL2xd7brQZxBhiud7mONTqbRkJMSImcWQXP
         vZb/Pz5n2O8u9mdFrvJ3EjvgBagjiaHTvbcEzRdrZb8OwHLTYGdb9piLp9JdcRlyXrFd
         r7dZLznK9A988oQwrSC3ovuMJncgUAwlvXO7wW2+gA2VESi1Ebqy94BEEBMrqPeDqAGy
         j3u9IpAzPhbxZVji/+wUfBkHiuHHCvvjuAyqeGcPK0ikewYDv/xHjdYqwypDVYM5nE3P
         zPpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782374753; x=1782979553; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LjtIzZk3vxrXZVAwqdL1YMS08SLuDbLYjQh10VCn/I=;
        b=AKTRsCGv3IZr9g77qTlA5BIacOlsNPzVA9sdsHbabceWaACWWFTDeuWpJ8iVTf8tzA
         dEYSKUFhhN+WRSQ9NL6XKoNQZ0f7SF8ae4wzGZwzJftIqdodN/D9i6USMLRo76nXgAJ1
         5eDBZqrrRQoC1N4Uq2cS6yeuhWBU47k/MQ1HmHU0IP/j3Dz9m0l+tcnN9LTL19pJKXAg
         GEVue4Rnp2ARvekddYlqT3wf0svoYzRN3xVAeCuOuXZSUuKNeUxD2No9Brr14SgcIxAQ
         /xy/TwqVrzcxWwujGlrAoIZdXtuMQ5yuELGUF0G6t1+8aKuTCdrEt+2Xb6SDyTBlZ3Ks
         3DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374753; x=1782979553;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9LjtIzZk3vxrXZVAwqdL1YMS08SLuDbLYjQh10VCn/I=;
        b=AOHuOT/jrNL0N/aX865QWbQhUyAguCyiw1Fpcd46yFC7Fgj4KJzSdGc7ad8OJI41ia
         sqJtHrAQ1td3pX1iJ3jMKc/3Ng90Q3EsFs93usO7C2GLPEHCA3HCisSL+hXau4dE7+Tr
         52WRsL3vVZNtHYBKTaIbo9YBsOiGb0D7PGWyg/VS8p+zo9do5quazCfXmNt+Hu2W5iZo
         /VolPjbsqiw0lPrcP9K+8NB8xdrC1FtltkkaZAhQCdX7EhUJ5ClLl2V+W8h3cI/fQ6q7
         5xDxozo9BfSvLRxwcQNIoAO/1KWZsv0txV8nU8YfbFlsMYbRffQzedD0bFkRSSCBxz02
         bChw==
X-Forwarded-Encrypted: i=1; AFNElJ+3fRsOLLPJtmSg2qwRTbOpv1XFxLi7DkB5QM33BEfQE8HWBrkePnMpMKQWpK/RIkA/GJyS4vvvYIcG@lists.linux.dev
X-Gm-Message-State: AOJu0YwzNM3JJiGVeeArjIV4gnHicxIXdYkidi+UVzu4rInGM7MlSyt0
	dLr655qwRdGD2VrRKHV5MonHYs7nOd9/4DLQqw/TwEwrDL+m3T2d+CYRLU+bXm6HqRoATaK+QoR
	8nZkOXs9m0LRvGCXc5cHvb92e5d+aC2hGb7kdA07a
X-Gm-Gg: AfdE7clXkGnVCCAdaMvp0nJABu6CsN3yoBZDQdiAjfp8yzTdJa8Y2SWUCwPPyMq4oV3
	VXLvzjqDLJloQEh0Iue8GFE0L1vfk6/zW3nwfN2fgLHpqS5NzYeoBePjncZdi0HzqgFtk5F9V03
	t3+UqJqrVDWPrbm+VE5/ZmuyTtyFE2CnxSlZDc2CoBeNa/PffWR1no/l7TQ2mE5sBcHrUbXABv6
	R7Q6HWJCk1aEDYPh96O4AfNAIKjtqicfOlj8jBfHnUsW5cbXpjxg8gYMoRD/NJCIEaRempVeQ==
X-Received: by 2002:a05:622a:4d99:b0:516:4f62:85ec with SMTP id
 d75a77b69052e-51a7097cdf7mr5787961cf.17.1782374752598; Thu, 25 Jun 2026
 01:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-39-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-39-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 09:04:00 +0100
X-Gm-Features: AVVi8CcBY4t5giF0-A9bP1HPllgz1zAJhj3Ny1-iABTQtlbD2BJIIQOiCS34wl4
Message-ID: <CA+EHjTxtL+usjD5XWzrEXegSAt-JD_SjH9MG1S6aOy8sWYf67g@mail.gmail.com>
Subject: Re: [PATCH v8 39/46] KVM: selftests: Test conversion with elevated
 page refcount
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
> Add a selftest to verify that converting a shared guest_memfd page to a
> private page fails if the page has an elevated reference count.
>
> When KVM converts a shared page to a private one, it expects the page to
> have a reference count equal to the reference counts taken by the
> filemap. If another kernel subsystem holds a reference to the page, the
> conversion must be aborted.
>
> The test asserts that both bulk and single-page conversion attempts
> correctly fail with EAGAIN for the pinned page. After the page is unpinned,
> the test verifies that subsequent conversions succeed.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Not sure Sashiko's concern is worth it.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../kvm/x86/guest_memfd_conversions_test.c         | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index 99b0023609670..4ebbd29029526 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -441,6 +441,62 @@ GMEM_CONVERSION_TEST_INIT_SHARED(forked_accesses)
>  #undef TEST_STATE_AWAIT
>  }
>
> +static void test_convert_to_private_fails(test_data_t *t, u64 pgoff,
> +                                         size_t nr_pages,
> +                                         u64 expected_error_offset)
> +{
> +       /* +1 to make it anything but expected_error_offset. */
> +       u64 error_offset = expected_error_offset + 1;
> +       u64 offset = pgoff * page_size;
> +       int ret;
> +
> +       do {
> +               ret = __gmem_set_private(t->gmem_fd, offset,
> +                                        nr_pages * page_size, &error_offset);
> +       } while (ret == -1 && errno == EINTR);
> +       TEST_ASSERT(ret == -1 && errno == EAGAIN,
> +                   "Wanted EAGAIN on page %lu, got %d (ret = %d)", pgoff,
> +                   errno, ret);
> +       TEST_ASSERT_EQ(error_offset, expected_error_offset);
> +}
> +
> +GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(elevated_refcount, 4)
> +{
> +       int i;
> +
> +       pin_pages(t->mem + test_page * page_size, page_size);
> +
> +       for (i = 0; i < nr_pages; i++)
> +               test_shared(t, i, 0, 'A', 'B');
> +
> +       /*
> +        * Converting in bulk should fail as long any page in the range has
> +        * unexpected refcounts.
> +        */
> +       test_convert_to_private_fails(t, 0, nr_pages, test_page * page_size);
> +
> +       for (i = 0; i < nr_pages; i++) {
> +               /*
> +                * Converting page-wise should also fail as long any page in the
> +                * range has unexpected refcounts.
> +                */
> +               if (i == test_page)
> +                       test_convert_to_private_fails(t, i, 1, test_page * page_size);
> +               else
> +                       test_convert_to_private(t, i, 'B', 'C');
> +       }
> +
> +       unpin_pages();
> +
> +       gmem_set_private(t->gmem_fd, 0, nr_pages * page_size);
> +
> +       for (i = 0; i < nr_pages; i++) {
> +               char expected = i == test_page ? 'B' : 'C';
> +
> +               test_private(t, i, expected, 'D');
> +       }
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
