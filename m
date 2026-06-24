Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F43CCFAE
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782330912; cv=pass; b=qGjbWUID0t/Y8Wr7+h5bi6PLe1Jbl6o/O20yL7tCybfOXwWOGvxYKGEikTdzjlxGubksjUyjTfjnxFnGB8N7QbAHhI24oOISlTKdazTHuxCwWu1iyOo/s3dcAuSyZiD7nOtLA4xMing38DrkyKDSUFv1kV1BIxf4s5PON6dIC4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782330912; c=relaxed/simple;
	bh=W1Q1ZIS1tK0GuoWOs7eGstZIyMHoTFwb+9lbpX5rjyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+Dj5iwgayZ49f0bIgm2H98E5Q3yAt7qiABCICULbjvkQsdLxnr45ZbvNriSFbo7XzLFisxxFf4TrVy0bxNCZKDPrJSMCcJ2x1+lpbqPyYW44HZ4w5bn+joVkqQBQ4JKgEbhfXgpGhR3g2xv9KwSGBbYsm3+r+80DbeMSK8VA+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QrOe3y92; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QrOe3y92"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51765331535so5481cf.1
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 12:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782330910; cv=none;
        d=google.com; s=arc-20260327;
        b=X+01t9X5HfUzXbXs2BVbJu7aN3r+pQrUOjZfGmaoeHb497lB2TDNSLUfhff6PpewcV
         D53km7URABxBU/khtyldRjGDGRuB93OAab4nQKv3QDFa9ICQWWAcAvYkhRX51bZF5o8o
         9kJ5FymPxAcQqydZItd6bhw7lOU/2vyYHJDMEksUIiAz18d+qzQjfI1XeAkL/QILWXlG
         V9y++BrrX2TWe4UEARGO5JI6x/r+7NbZWu9zwPjMr91WopuFiNoTA2b9eBBYbXUHcKoW
         fFC5SVQDZsktFsQOPSLy0uHvtCKLJRKEteFnmH7DHu5unpcySs6IHmMD+X0cqD+FPIix
         /yPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CJJECXfHWYzxy9+jrHC2YkFB6UtBZdMEUotYUUXmsS8=;
        fh=JS7rSENYH/a+OH7gFbsoSvWY+LjSszwmW3VbudXIFg0=;
        b=Q3GUeSvtweUCwp/J3C/w8jNgNWRAAkpw3fmAURkeaZDIl7M0e/CFEP4O6H81Uc/JmW
         D/GW4UJU/ImUdw7Rj91OobQT3yqNK4o0u8l/G5MusBfeap2+2sLImw9OV55Nae9RXsOl
         5RUNLhyxoJELkZXoOP00a/a1OBvG1cK1vQBViH+maqDIhc7jUoI2dIqUc4y9xXyFevNR
         Sxx+wSUWn3BZ8iXbN+ovKbpIIHLc17/UF4aB4CKw5kvhDBMVcCVo3JlTN+VgLPYJ6sVP
         iDB6HGnqZNi03mehIfde2EG26+YnazL3HeENRmi7L+uErD2Uj0F63phv7MFCQ5G3Geo3
         Z2XQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782330910; x=1782935710; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJJECXfHWYzxy9+jrHC2YkFB6UtBZdMEUotYUUXmsS8=;
        b=QrOe3y92CbgAkFwlDlmtF8nUBqBQuvBLsT0bE47iigEqYmW3HYjDy7Hrz2FHcQ+bj5
         aiStSLD33lz2b/roqjrpBDHndrAu3ASRvAc0NmW2GYyUzqqdKm8TFzQS+jeCREQxdJrI
         /+BdnduIz+/c8uE4/9FUhBJ8u47N/D7sIeIyKXC/GcDDpYcW1krYafSVtdl8cF8hmB0F
         bJ6Jl+/aIXOsjG16NBBQI+3y/hKY7R6IICTIMeaTRqe6PaKkglf/RzL0YvWmcn9Kc3gc
         XedGbFZWgSljFr1Lzm3mHEhN7/ATbgYM44OKeExy7sJ/bgT4AuG7dotVkfL9vca1Co4P
         Nc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782330910; x=1782935710;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CJJECXfHWYzxy9+jrHC2YkFB6UtBZdMEUotYUUXmsS8=;
        b=YCKK0CZ4jQEywt4EQZ2clQa42qzpUuSrgwb4ec4gUohikQHHAwhYEOuIfVrGNGHLxB
         ZqTn1h72h296E4S654k3Wvht59AHckZ81Gocu88wEnjskFtmBhwbmU3WBCkj+dFL1uW4
         iJJgFAWThVlG4zLojJ7M+9srPCrQjGc5+gG3gCAuBEHoZ+bmBVQY3l4pVdKucsFlG/5e
         nEpeyBlLGomRKBh8mhzWe471NnJQ42avXtfiUOW6R199OAuBa13tX5b8eiaKb6/I2Fbo
         udnMq3ecMznu84TKbSb4J/cZ4gQ2mdjZH/W699g0kVsCoOXklzQui1Gn3egGZfDP6TTt
         ABbw==
X-Forwarded-Encrypted: i=1; AFNElJ8F6vU9zGuWCp3zJataPGBx7xr8ODm72BnHWG9gb73sh/Qz5oztpeTDoMPUh7dosyBDQQ+qxTwQfR1F@lists.linux.dev
X-Gm-Message-State: AOJu0YxLAqVC+VUry/1u8YEuhWxOmC4v2PzJgvUkQoIVymyGqat2M5aY
	bQ65q+g9lwqIHOQ7Jf5wpboXQbfauNX+w/IhWLy4ibyWWrntsIhLpFCDJ+nZvGYnbh9lRBd8EdQ
	dtEVtGDO9LvszeP/lf1t493km9o6BO0BmLOczsWwL
X-Gm-Gg: AfdE7ckB2jptIWsB7Eu+kyY/J4txb0SUKNo4IBtdNaZ1LBCkDe3tDk2e7odJigOvKkw
	1F+lUU8q4jKoI5hUoPVF12CVhffwiwh4zNUIpaAF4Yei7A5MjQ2c3fELS0NoE8vboZLzx6Aa9QW
	aOrST09ihiNmvOJgIAiFUgt93ciq78NgDZqZY8kgKpEmUFf6ZNZSLfDn0t8TBAiWWMDzwDM78xC
	edfptGYJmKAOJQXEcDRwCmygVDnoS+uvEgDkry8XmQ+DFmK6aO6+zF4ZR/AftDWIony2C5GZQ==
X-Received: by 2002:a05:622a:64a:b0:519:df4f:6c93 with SMTP id
 d75a77b69052e-51a6ebb200dmr1920671cf.20.1782330909527; Wed, 24 Jun 2026
 12:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-32-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-32-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 24 Jun 2026 20:55:00 +0100
X-Gm-Features: AVVi8CdkNL-Bi4CuQeJBlP58vmddsTQ61Xm1xaJ4QXqFxTKdTVP42Qqva81y8NQ
Message-ID: <CA+EHjTwJYQmg6oTU49ObF5fQCThghn+TMau=g5zUP8w_KLuiKQ@mail.gmail.com>
Subject: Re: [PATCH v8 32/46] KVM: selftests: Test conversion flow when INIT_SHARED
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

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Add a test case to verify that conversions between private and shared
> memory work correctly when the memory is initially created as shared.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../testing/selftests/kvm/x86/guest_memfd_conversions_test.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index 8e09e241723e5..5b070d3374eae 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -95,6 +95,12 @@ static void __gmem_conversions_##test(test_data_t *t, int nr_pages)          \
>  #define GMEM_CONVERSION_TEST_INIT_PRIVATE(test)                                        \
>         __GMEM_CONVERSION_TEST_INIT_PRIVATE(test, 1)
>
> +#define __GMEM_CONVERSION_TEST_INIT_SHARED(test, __nr_pages)                   \
> +       GMEM_CONVERSION_TEST(test, __nr_pages, GUEST_MEMFD_FLAG_INIT_SHARED)
> +
> +#define GMEM_CONVERSION_TEST_INIT_SHARED(test)                                 \
> +       __GMEM_CONVERSION_TEST_INIT_SHARED(test, 1)
> +
>  struct guest_check_data {
>         void *mem;
>         char expected_val;
> @@ -186,6 +192,12 @@ GMEM_CONVERSION_TEST_INIT_PRIVATE(init_private)
>         test_convert_to_private(t, 0, 'C', 'E');
>  }
>
> +GMEM_CONVERSION_TEST_INIT_SHARED(init_shared)
> +{
> +       test_shared(t, 0, 0, 'A', 'B');
> +       test_convert_to_private(t, 0, 'B', 'C');
> +       test_convert_to_shared(t, 0, 'C', 'D', 'E');
> +}
>
>  int main(int argc, char *argv[])
>  {
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
