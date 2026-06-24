Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC3131E852
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 22:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782339948; cv=pass; b=gvGUMMcDlTE+qY7KMBQZWvQ39N5k6pxDgvEj/yXaClMsKkq4hxohqSvna2y3E7YYFIIj1K0LiLIsiIVpUTi32nlTy90tjzIJt9NP72wQRZ/XXYv0dnyxXtNEN6FB8aTGGGNq3G8hQMG3K9HKBbU7ZB+YpvxUGrRwT3gdaHppA94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782339948; c=relaxed/simple;
	bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXBSyY1ozbi3+7XxNvHXnFVV7I7IgYwFfPLQhRw1cmvkTMSaWoVG49GBRiK+vw4QYrZRzWgh+hE6QkFc9XiqAFvgvyITj/INGqk/Te3h8ncH2YVy35h63uATth1eeH/ZEmOB5G1ozFJR2NBZqHJCAweYfZlDPxJtiqYdIDJvmqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XLTDOG4V; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XLTDOG4V"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13809223fd4so1883372c88.1
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 15:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782339947; cv=none;
        d=google.com; s=arc-20240605;
        b=EA3VtGngEcjSJyZsvnw8ugxG8so3kTwmLomxYR+Fu6ugj1hBRpijhrY1pKFb+/B6jX
         i4ZptOqwBKBqhFBoMzSqpHlivR7aaX396i3/3OOyJOAKEGS1MmXRLzjfn1AITp21zGTB
         de7W1LYrRh5nCuLYj8WwKaBVx10Su/x5+I3eAHd4QYcEPqnQXXEt5Jh8Jzk23PiVIe9Z
         6FX/TwLfOGaknosbv56MG3tAy7kLuuFKA1s4Qgi68C8mVhc4QTKVF7DqVX31DwIAHFMz
         9gkC37c+AoZgrzcy1Df+U2Wky/k+tusridNbkqvgyu/OMC8MpHWasQdWJN3XIPTaC/Zv
         6gIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
        fh=qp0ETpvjlush15g3Vm/v+qqtsoZMdJmqb1zKy1lQm1w=;
        b=hrFl5IkuCr5FHnB5F+aQk/oJu209MnvZqd/BFneWWCEoCXlBBXvDl7qSDDTydDV0Hd
         CadZtLfYmiUt6adLOiHMpSfq79oRZT6arbhVwVutFluJxhW6OlCdJWgOXZItQwpNmkac
         2HfoW9aZtQolwtbZIYhIjF7+3Gw4SherB528E+JDk4/gfuSdyixR4hDFPYchjjQraHVx
         HOjK2fHQaNwb8hDz60qJFxBE2vDdzRVzLrirkwRdkfO80gyDufr7zZYNQpF0zi5gXmm5
         SeveoBpBmXTVhfzGO0aRqgoN6v/WEJPXlqjYqtW3b7XgA2/6tpMho8aG3D1HSKYmUbyB
         pKNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782339947; x=1782944747; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
        b=XLTDOG4VyLyuo2jeSX17y6kTy+t5/g2kzoypFT+D3lx5pA1CYGAQhcPBtEJ7Cabmi8
         wrTsehzSxlOwUcsxmy9VUxru6CUb48nCUiWmkGNlp/5qF7wxt8UV25EuJVvg8ARUqGAv
         ib+BKdLHMyzLeI+3MtFR3XFqCLQABlJjrAhqplZFIO0cFSKm6DBfBqlxCMr5VpqGj7Sm
         ua6o9JurYNTWPeVaIx/Y7hZc5N9kELsbVQsH0D8z8UjXLaI8dXSPRSwIW5zMIcu/XYYu
         BSbsgRtc/SF1PpLV2dmi/n3ZeFK+PtjNwiSozHmbrpTYbCj/O0D+D7HPuZOuMHzef2RS
         4hOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782339947; x=1782944747;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
        b=W4Qy1GwH2+K5hVacEU1a15OKzraMoPSVzXwfHUisX5xsdbOtW7bcK6U36QGYShBQW+
         oCN7fjwuR0T0P7Q/Q8Bqcbkptvab+EdWyahTFqJ2RBOlreFzD3gxRXX7goCGDzgghKnJ
         g0znXuZkMuaCn9Rg3B3hGVPUIrwcAIcV8nmfJnfm5VfjcWfHU5ZEf/bdsi2Wj1nGzlkQ
         KLQ7zut1aOTPHxM98NULKBd27pljG/avjIGLfgO/vdCWsLVhok7MNyUrEkiEtvLQoTks
         RUvmid8EUNeUV7O3esKlgyM8BfTh6ZUFpEabPemOdGprYOBR1PgAozFh+FI4uV0jceY7
         zSdw==
X-Forwarded-Encrypted: i=1; AFNElJ9galQv9yWSgqsloxkaxVdvh5YySh1knE521vo8iENGg4/BuA8Pk9+T5gkN3kireL2eNWPVFwhYrFtE@lists.linux.dev
X-Gm-Message-State: AOJu0Yywdib4bNHq951UInWpuh9Y57wzBHqvqiU1goN+5Kd2AGnb5CKi
	EnQSQ3uysrJhLqEvAGJzxmhr8cXEVlmjFpfymlUQoSOXPTA2MrxDjtjOWwET1D1sAxOo5Ph+tE1
	QzTxSMJ773JLoNAkGMaZMpsFMyaEi6L0EAAfWWGu4
X-Gm-Gg: AfdE7ckdi1faiECJRneltnldJF2MRmqPYDx0q7K1w+d5K30f8kgKuELAlsVdO4L2Isn
	zO5Qfrene+M2PcXqB4XSaUql/XD8gHgxVq2OXMCX/aqWSTKDwWgadE5KcvlQjLclCL8aU27z+Tl
	rlyEHk/IA5jJTnAjffqEOnMEr28axM6ZejsBHZPkKNjxqyR0TN/4NC5YFgoNnDXRiNsl9Iuw9j4
	JElXTwcBufIlh5kvh1L/9dXMft3YVEaqj32UAtr3qsxhp6hX+u3VLxp4D0MeZNPV7gGw2FJR6PG
	8tQWz9TJlDHOUaQtgJpQnzT2ee73yze4S6Hqt4Jtsy9yspNc3RO1FDb+gDAfW6Kb2mU19Q==
X-Received: by 2002:a05:7022:906:b0:137:e6a9:b998 with SMTP id
 a92af1059eb24-139d0c99607mr4114854c88.31.1782339945380; Wed, 24 Jun 2026
 15:25:45 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:25:44 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:25:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajwMYCSrPlxg-Fok@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com> <ajwMYCSrPlxg-Fok@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 15:25:44 -0700
X-Gm-Features: AVVi8CexQH0jh1eCpdBx_tPh-SkjHNyZ1QVX7X8uuwzX2_PG5elQvyIsXuHuijg
Message-ID: <CAEvNRgE8HZDOnexMJeim6TjmxGG1AUXFY2+HH1YyKB=aM6D-DQ@mail.gmail.com>
Subject: Re: [PATCH v8 18/46] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Jun 18, 2026, Ackerley Tng wrote:
>> When checking if a guest_memfd folio is safe for conversion, its refcount
>> is examined. A folio may be present in a per-CPU lru_add fbatch, which
>> temporarily increases its refcount.
>
> Under what circumstances does this happen,

It happened 100% of the time in selftests. Perhaps it's because in the
selftests the pages are almost always freshly allocated and so the
lru_add fbatch isn't full yet? (and that the host isn't super busy so
lru_add fbatch doesn't get drained yet).

I've not tested without this beyond selftests.

I don't think we can depend on workloads to drain the lru_add fbatch?

> and what alternatives are there for
> userspace to work around the issue?

The thing is, the refcounts don't come with a label of who added the
refcount so we can't really return a different error for lru_add fbatch
presence. All folios get added to the lru_add fbatch even if they're
unevictable and eventually not participate in LRU.

We could make userspace try fadvise(POSIX_FADV_DONTNEED)? I think that
has other problems, and this kind of makes userspace have one more user
to guess. Userspace already needs to check if the page is pinned for
DMA, and if it's not pinned for DMA, userspace already needs to retry
because of other possible kernel users...
