Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53533E557D
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335038; cv=pass; b=hki6VdtwIPoBRqKz+fbIVQfeSFurjJDhvRuwsLEGyY/yGPGzmgFUSKLmvncvV4qADUOzHa5NFrP8i9O1T0mHhQMNAzypeRUMtwPOKbXlLB/WeWfIaNeyTbxRfg++bdbRVEBquxIvT9xLpUo7Q294odjE+ICGVYJA+g7P6uiqkk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335038; c=relaxed/simple;
	bh=ZP8N6p4zyFdYhpwemtjmNbpSTSjuQDSqD/2oIp/CY0o=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTyuLM8/rP2pOtUqsf+U0fTUGndxAyD4yu0shM3jIS8UV33PIAgff70xz+17pFn+2Z8OsjlH1zKtsCFWMPLgDxsMmL+6SWNWattKX5M7hWWBanX7eMN/SulgMFXw9waz7RiqEAE7gmyWdqN9YkmBTmhMz65FlCOmYz2VcK8aZe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TIj3j12E; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TIj3j12E"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1363fe80fe8so3034376c88.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 14:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782335036; cv=none;
        d=google.com; s=arc-20240605;
        b=fH9mun7sMXyBkfJrad5bs+VyZFDUe2QB5FBWDd3Om2wBA1LbCi/kjxi2yz88ZhT4vO
         UQWx8+wkO733B2I0b4g6317cIqeaLxz3otb/4HOMnQyowxRPy2/BS+AmOWxcpbh79l0L
         hETmHVUYOG+PTlo0HnEQTspRnJVvcKGir08GaVz3mmQ595IBAPZVCX+AFkFxnd98NZBp
         OQ7yGwUMOH4a80h52BXKSHyYYaeefwtjlDZKwkf2XSD5iwwu27KiN7ASkOm2uM0on6SR
         1i3/0fYmylDEJYd+djeBNj29lkj8VnBNF0VCQRMKkV1PKC6KMo+u31nYSy1/wvPHmvm1
         9pkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=JtXqtocb1qS3/K6xnMYZSBV/6kQD50+mfkfO7ut81Ek=;
        fh=W88LehsJiXvQrYmkc7zQ37NNwBH2C4d4TwOOAl3sJDI=;
        b=drr5tlIDbgSmaWuyRD4792/zY5VHLpeK0+3ZBXdhdIsmT6MN+/pWbYZeeemCyr+iWH
         /o+ZjkLQKXCggMqifu2A1QlBIpGxA3zu9qkk0+NdZ0UbzkxAVpOTmq3s7hFanCWdu0m8
         p/SsfmiVumEBZHjco+nQ6Zz7uododIN2mXpbD7ToVKBOuocXzF27QK2qhmyadTZGbgRS
         9NP3lG+38YfJc7poaPBUCYhY4fP55FggmYB5GnAgbMX8j3e06B8JuilEp1+LyGLCcIp4
         zX7yiHgHCB/s7hPymo8DFkbf+lTXG6DQcXobR4dounXpbvgbyZ6LLVjAUxLqn7tILqyx
         SLnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782335036; x=1782939836; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JtXqtocb1qS3/K6xnMYZSBV/6kQD50+mfkfO7ut81Ek=;
        b=TIj3j12E9fEjYTES9l6S6/4oiOXSWZD3wlnh0GLoRda/QcamrRGNKpI/PWkI6RJ4Bk
         6jQt/W5iiytm0zT8/+WJdmP5O17U8cMAD1PFHv+nSlEaxfeT1iXGToU4jZ7KZlXVXcOy
         0GIIuVgqhiCDQjIQu1dU13QwL2AF4Ne1yh+4ex+h9hptuMSfG8G9c87e7L8A3kz3sKTK
         RhIspX+WYlH3DHnYuQXl4ii3kWxvV1z1ZBd1aXHqAqeSqVBbMftksWAM6xMDl23+fp4N
         gahZu9uYFM/xXRy75qI/sWF0mvEBV5Ax2AHaGhS+vVO54bGfKnSmvduTPZPIY+F7as1z
         0SvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335036; x=1782939836;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtXqtocb1qS3/K6xnMYZSBV/6kQD50+mfkfO7ut81Ek=;
        b=ZodeqTn6fLDtHwkaVYlCKsXmMl6rX5+CwEJ8eoGM96XhIV96VJSiYP7LipJOf7kRDC
         MjWz0VPy3GYv7JO49JT8kwh9otGJRXIsMxAVQB+F4/1v0GueC5a6mkedEPoLiZXsT1lj
         AO6BnMLciorT1rirm2MZ29LvrCsOdCJPxYUtWejEhLQUt9HTYIy7/KjUfYwrY7yYaSey
         1NBEuWxxaOSiQ1DpiQYqw4oUbSelJo1EF4zwtUiBaRqSe48JVoJZUgXd3z7w30TviPyY
         yTnhwcWvJV1yxVqkAubbrAsKuvmr+xG//Lxpfu68yxzIqQzVIBiuq2D5lF3bwECVPrMl
         nXdA==
X-Forwarded-Encrypted: i=1; AFNElJ/1178cWmOBG6PAgC7wAQbNfdr1MDCOAFUhl4yd0bj1LurPKdhz6EJkO5WQxYv30U1t+jti4r1AoJe2@lists.linux.dev
X-Gm-Message-State: AOJu0YxLMpTuHkTlwdDYSa1j3PazR7VZgcvTwIH4DpZGVJk8dRTEhjFB
	MgyP22EUj5wUEEMouhagrE9H9qfrix+pUUJiAM4ZTDlb9ZUJezDodpXf5kGwsrNL+O88eSjw7oi
	EDEOasowxdfn9OSPEBab0wK3AnbRofI7DMdzx+uvC
X-Gm-Gg: AfdE7cmX5q402i2Rgijw9o1MR7jDjsEf+ZplyfsRcluCFld5Vzr/ySjg9Yz9TbfJMHU
	iZ9ab9wiOu/XiCNZXeXgyYtoJ/ZANkgl8OR9BRjWB5pQucQ+e0lvyPmyjH49fPAiMPuOz7YHtUe
	sLlnkD71LtuFLl9X5gU1aPsxBAsD+aEBc6W3f6BxaHUhV4ycOGOSKRct8CEoSDGjO9BfeKcMNLm
	SflL1kDLqs4JH8JfytqgYFVgWoLbRXa56BIzMDmiGyjI5v9yDUQsZX/kyJGg4s64Y+DENMavA01
	za6DoF0pBa2BiNwJnFXf1S8OtkmcROROM9iIowaMEZq9dK9/oZhIAhoaFtU=
X-Received: by 2002:a05:7023:a57:b0:139:d82f:2fd6 with SMTP id
 a92af1059eb24-139d82f32c6mr811137c88.22.1782335034214; Wed, 24 Jun 2026
 14:03:54 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 14:03:53 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 14:03:53 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTwLPCvZJgPv=8u3pgp+kwEwQbsXn_13FL3xUbJ7HRfXzw@mail.gmail.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-13-9d2959357853@google.com>
 <CA+EHjTx2xKjheiW5VzHw_TdWFUqdJqfgu=dOPa=_yaYBMY8uyw@mail.gmail.com>
 <ajnRxuJ19OzZ8zJC@google.com> <CA+EHjTwLPCvZJgPv=8u3pgp+kwEwQbsXn_13FL3xUbJ7HRfXzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 14:03:53 -0700
X-Gm-Features: AVVi8CdCAqwoqTik6utb0yHbQZV7yiwfOGNo-KA9dUnC-gGzh63Sika6JXlmCvk
Message-ID: <CAEvNRgFDcwXAx0YYZOGzA+adVhtMLXaR6KkYtW=p4xL-Hp4pjg@mail.gmail.com>
Subject: Re: [PATCH v8 13/46] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Fuad Tabba <fuad.tabba@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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

Fuad Tabba <fuad.tabba@linux.dev> writes:

>
> [...snip...]
>
>> >
>> > Note sure if it's user error on my part, if I'm applying this to the
>> > wrong base, but I found a build break here on patch 13:
>> > kvm_gmem_invalidate_start() doesn't exist in the base tree. The
>> > function is kvm_gmem_invalidate_begin() here. The rename
>> > (190cc5370a8b6) landed via a different merge path and isn't an
>> > ancestor of the stated base.
>> >
>> > Patches 19 and 20 have the same mismatch. Fix for all three is
>> > s/kvm_gmem_invalidate_start/kvm_gmem_invalidate_begin/.

I took Sean's patches (off-list) and tried to combine it onto my
existing state. (I'm using b4 [1] to manage these series and I didn't
know I had to manually update the base-commit. Will try again next
revision.

[1] https://b4.docs.kernel.org/en/latest/

>>
>> Ya, Ackerley used a slightly older kvm/next to send the patches.  I at least was
>> testing against kvm-x86/next, which does have the rename.
>>
>> Other than noting that this should be applied against the current kvm/next, I
>> don't think there's anything else to be done?

Should I base v9 on kvm/next, or kvm-x86/next?

>
> Agree. Sorry, didn't mean to be nit-picky, but this really threw me off :)
>
> Cheers,
> /fuad
