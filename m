Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE40A3644A3
	for <linux-coco@lists.linux.dev>; Fri,  8 May 2026 23:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283406; cv=pass; b=GtiRjjhvsP+HZgwcssEe9VcuucCBm3oXN6bl/6n/+hUS8/w2KOM0dqjYk2nvpcTLowMra64ncJWRWUgaZmDSzkGZ881vL8knRYtgb7hsT9HslsQw45cxrOHkJaFvnprQbWcWpNHpyLN7JiocH4sis6F6RobfM5xItcvRmV/zMmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283406; c=relaxed/simple;
	bh=qugc+0Ib7z8RHG2l2I3zLFMp2jsqIX/yclDbZ06fydk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIWN7o0LrOR4GZoALhSYirKBojD/kFY91beLc7dmxIcbiG22xrZBytHpl7nCg8MjrpgNtsHDwIgbVksFYw7Vd69ZGsLkg0F81jWK7dlgXt5yUlGIuY8VRtiCunaEPyutWDZ+yibJ/s7/q9DThdaEDUv2Z+1MbVVFZsLAYdC1wNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GaCyKO1b; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GaCyKO1b"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95d04f205beso1522116241.3
        for <linux-coco@lists.linux.dev>; Fri, 08 May 2026 16:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778283403; cv=none;
        d=google.com; s=arc-20240605;
        b=aH24QNnCi8KVvtNqzjgsFumbQqkGuCaTpWSHCM/ElPph2aPbcGtpcVlsOmYw+F6LdI
         lQ3bL+f4v345CpFrE9NOneFc4vP4SkvuFmo7vl/OJecDTqoaaKEFhIhdevvzjqu7fEkv
         LQ0SCpeh0TEB4Ep9+Q5K6k8wQ81idFOkx9zNsmef8K4TvxifH3wj+1P072ubGgX4U6LO
         BcyUDjkNAaY6LSEr1+Oo6tkAvBtAONo3EChHybBySIpKat+1EH9S5Gtfq/xaqqLIaCjz
         4bpwbCNdK/Xgl1P+WY+22ek/wEk4ChO9VyIeIWeqZaZNiV3+kwVoCD0iCl3Kh0Q7lU44
         x/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=10imNO/dPWbMThTpLIZ3BPvS8U4RD3Gbc9CIOJSztJQ=;
        fh=fQmMirFY788XCvbWEOvE4iufafbgcjzMoYX7nD3EHw0=;
        b=JP7bEhTGbWysuRJhqcosG5EmG/nguOK+htHL5k0wWMV7P3bHXc65rDLMNZLA49y8F/
         gAOLqjfXex0iWaUR1uvVYkp0LY/G13aYLnAJXsTdGOeQfv+NaUDmdbZn2jtBBxR2y5gs
         gI15cYFJnnqUEK4/13iXZ4VtSNDF/JERs2rB3ccRZsC+yybh5Dq7EaLtoSaLEZr3gy7m
         fFSV1CvI5qy6k87FU1/Ey8dIdUqTykMIb8WCPxldC9p5cNpT3igpm9vAYAe0DfkoaWOJ
         raLEKKzEpIQvGzHtt+F6NoQ3LC0He9R57D9UlTnaiRNTJVjMRXYa8kBqH4R4qV9q4OL1
         tvlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778283403; x=1778888203; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=10imNO/dPWbMThTpLIZ3BPvS8U4RD3Gbc9CIOJSztJQ=;
        b=GaCyKO1bQSVXOJ6wfyDkglrkRdAz4BVByxzhdJfcyj1QqkwKoNgzqyN0AkNXu0ZxLS
         do6df9CwiRF+1pmO7qu1yekDqhRfGsw9FHEd/E+0x07R0sWQUWUndtg4RQSASITU7NkM
         pQidEyA3PXqr9Xt38QttQTXuEefVsLNpJ8WRGMXjEPVw72v1GVqHVVGQBNxMF4qxv1xa
         TY+WBUh1x2umEWOwVrVZzd1f1Cullj/8aUKYBxDZZ3af7DGIojSDp9g5hrCQ3+kTYQn2
         pUGllgFg2Cho6G/oyVtrHw7tCeNHu2lp/kgBRpsWqs33cMuW4cbiqOwWeL0DNk+jE9xT
         lo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283403; x=1778888203;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10imNO/dPWbMThTpLIZ3BPvS8U4RD3Gbc9CIOJSztJQ=;
        b=ODbmSwii7sqrCjAcVqoWWizuids3h+GqYEDzrpwUVOZkfNG7nfRFBgHjWNB59T8L1k
         caLH4BYIDmMZWsEWHEzGQBPsZEcmyBxpV90wjcY4ERmBUmWYeAmvLxVjD6k3hXrVIUfc
         asB/MDKUlg5zo8tvWeH6xjKjAp6RGzhq1qV5OfeaRF0s3yrvP+kWXCi5XAtxWESzktxy
         HQf0MYsSy3acGLEdK52C/MLZ4i2jNDOzPgCzNmcauraQrvp8t24HOareYvEjHqA0NmI3
         5qOs8bqBHhyA5Gx9kcNDpzWuMO0DKADOFJwoTVKK+8OBGLbLKa9jf2K0HpQcslmRl2PS
         jR2g==
X-Forwarded-Encrypted: i=1; AFNElJ/aLy8uMlvj3JsWT6t6f/T6jJv0UgK9tHuzJHZHEUL1swZH6N4NFOuQxSZdTXBhoFJJi8wpc2CGvdJL@lists.linux.dev
X-Gm-Message-State: AOJu0YzCcTCWvzXD4yjtFBpAw+FMGwLQdWUA1PMm8EWmrsCZi91+7HDW
	X9XNAB/NVlvZF/tIAr6X6zHhSLQg2QXXjogx+jWu2VAUUgJtQg6wBVyD1sBNA8UsVDnxxYi34YR
	JHSBCUrtXlUqqAgjxVOnJElrX/wWKm558bDqQJRg2
X-Gm-Gg: Acq92OFfjNCo2TagUq+8Ji7Ko9cL+f3ASdLB9xNx3EOVRCGCCkWBDVoj7MuxaVNyIEL
	kfniTDf7KCgKGvrOFtrzB6NSsGFF5rnLVIo/FD84Kk/LnLB5jT2bIgRHWF6MfDWUTZA5iI4zanN
	HEovp63qsXT+9MdNMtYbQl9cXQSUZcqYv7EUX+9QlbsRDEy/l7fSMWWI/en2/FL2VcL9Nl7rQmd
	WxMzHov1I6kAQPxYbkUiZKUPUYhWeAFSa9f7MM8rUCkRn42d4mSdoMwhmDF7r/ghsxb/grATj8n
	iWFrr618VB3BTdj7izEetjaiRPXIcQKJvU3fCkbmHMbLSyNiMUWU5U2KYulcmCfY8twqxpqjTUk
	WsVJNozNyDF2fN8Y=
X-Received: by 2002:a05:6122:3208:b0:56e:e80c:bb25 with SMTP id
 71dfb90a1353d-5755963576bmr9165277e0c.13.1778283402011; Fri, 08 May 2026
 16:36:42 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 May 2026 16:36:41 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 May 2026 16:36:41 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-1-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-1-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 8 May 2026 16:36:41 -0700
X-Gm-Features: AVHnY4LvPjVICPzN5-_CJPHTIx7ocT885vUY-RO5A-DcMZDUx5r_5g4UegbM0fM
Message-ID: <CAEvNRgGF-n5gmTR5G7wZqH5gBZsOp6WMR-RSws+=g9tcCkfSiA@mail.gmail.com>
Subject: Re: [PATCH v6 01/43] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

>
> [...snip...]
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 69c9d6d546b28..5011d38820d0d 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -4,6 +4,7 @@
>  #include <linux/falloc.h>
>  #include <linux/fs.h>
>  #include <linux/kvm_host.h>
> +#include <linux/maple_tree.h>
>  #include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
> @@ -33,6 +34,13 @@ struct gmem_inode {
>  	struct list_head gmem_file_list;
>
>  	u64 flags;
> +	/*
> +	 * Every index in this inode, whether memory is populated or
> +	 * not, is tracked in attributes. The entire range of indices,
> +	 * corresponding to the size of this inode, is represented in
> +	 * this maple tree.

Concretely, if the entire guest_memfd is 2M in size, indices [0, 511] is
represented with some value, either 0 (SHARED) or
KVM_MEMORY_ATTRIBUTE_PRIVATE. [512, ULONG_MAX] is also defined in the
tree, as NULL.

Since guest_memfd uses xa_mk_value(0) to store the value 0 ("SHARED"),
that makes 0 distinct from NULL, which works for guest_memfd.


(Liam and I discussed this off-list due to a email configuration issue)

> +	 */
> +	struct maple_tree attributes;
>  };
>
>
> [...snip...]
>
