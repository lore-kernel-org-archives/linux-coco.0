Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDCB468C28
	for <linux-coco@lists.linux.dev>; Tue,  4 Aug 2026 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851185; cv=pass; b=nGBJ77eYXlSheg15eCGrtC83WA86gYVB040T3o6chUWIARAM+kbZK9Aa0VGro7DgjMz+vp4h/wigfj+prc86zCBdFyVkdlncaubXBHV69isoMOfKgaaJKAs7dCz3EjfVx369T/KdTHzZS2buUvDqKal6e3WxnyX+VmaOFmvbB5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851185; c=relaxed/simple;
	bh=G5AgHHHY9jv0ygOB7Vo21BSZnxPwBZqAq4GmulyN/nE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcoYXi17+lWdTMsSCDZ8fBIPmA/7890XDgCxKQxj20gci74Y0VOQeKxUk4lOOdNBNTGOmP2I5RvGHB9Zp6iyREO6wR/JSsegbbCUfeDQLM4KDOYrcj3v4ko6jQT7kNJFSrbypqoLN+eBfR683oUWNm8GmvNk4qwZK0/d9aj6yLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cexc52PL; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cexc52PL"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3849502a12.2
        for <linux-coco@lists.linux.dev>; Tue, 04 Aug 2026 06:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785851183; cv=none;
        d=google.com; s=arc-20260327;
        b=CTrbL3RqH0nVa5GmiS7QRC/abZcSGZ56unyFg5tugjx1Sg3lKnCRJGX3BKx7MSIMhm
         ydEOzCRanlPtqhp68wn6oZTqANz2uhgWdEqH775rh8B9Ixdtutnenu/BcWdWj2uoTySe
         jHnqKphOy5nh+EGuTRY0msHxiMfxGat9SfyFS5Sd4JZOAsLiC4m+ieET4EoM+u0CgZoy
         oixFCXLaTEy3WeFa1fE7RIAjcUmMPhOKYuTn9mm3gqDrJ5RMV35lylMTABrMPHo3KUkW
         jR03S6e7LWYXXu3qvfuKXqaIXCxA/skswFjPhpq0Z+rXTZf06PXwZPl4avgLt57eRiFk
         ZVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=53G6mJGAaV7ofRwgRemJGkr5zkTXgvKFenxfcvtRtyE=;
        fh=Aw1z+WJp03pVJKix76Wo+PuQ2xqe4f4WR2icH/5ViRM=;
        b=g9tIV1WXio5xL7XGToVIMGwPwWBEoaLZFX+RE52JBT+uB/eaU/n1JecPNiAbV7w4tW
         vrOpcEs/lfwzxKOHx41BkJBFcnrO72KPKdsgtFhSSF5065IPUiMBA2A7UE0mDpS3P0Q5
         5rc2EVY8RrrzHOT9CR2DCgYh30dcxKx/gC0xQ96a6b0dAfuxFNFq6JY4kOtJYMQHt+4l
         gRjYsHLsUPlO3zxHjjtutCvxzahTqx3bF2RR7kB13QqQRDRolUePSWjAeyoex0BXG1YM
         6fYXcmiU1QBLXjZiThLYQxxknWn55Ncy/ZJuFVnEBL9+otlIwhaEzbOa8Tgihmvsk4Ct
         Re2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785851183; x=1786455983; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53G6mJGAaV7ofRwgRemJGkr5zkTXgvKFenxfcvtRtyE=;
        b=Cexc52PLFvN/o4aB1bWBgDwVWXYHBXg2LfWl+zGvd+GA8yCdXTFaj84S2+wzHvy2wO
         gq9gnCFH9Gd/K0GcpL5yu03cu8ufGKYDyQPYYj42nmSHGkygxy4xlqAlJjJy3sKDMK5h
         VWl/w0ACjKyFZ23oEoCp7/dETUSKHN1pWRCoHVO2yWE+KpfqnmMwFEd5xnrKa3fnhB5j
         9Do9KMRNrqD5Rb40wg+WbmUlw0OfTAH/MjgaNN2OCBMiqtf3GtLR9rnn/tBNzprHP9kn
         X3I9Lz+CuSXKih/waz12sXJ0X66i+ggW9Sd/767rCQQZOCMifwPCfiImDhmeY0s7ln+d
         qIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851183; x=1786455983;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53G6mJGAaV7ofRwgRemJGkr5zkTXgvKFenxfcvtRtyE=;
        b=ONCZpVDa61jAgxFoR+vOuCPhVWcIMgZcYn/BaFaGeE0WnkdSeJrb+OdbIX8uNdR+50
         OvvHrnMpuihVjjB86CJ5qqFpmR43I6e6iTYZcZnO7jUcDqbkLwCUStz0JO0+nd8kQ3Z+
         IKnCUIOcWkYPSzmeo/+i0EARVLi7KLDRHeAnQjAyQKYmkEvMcsUDeL+v7qXzAHHBecpt
         Wb/jw7Bi8PaKMHTpCpVZRGDbT5ChyOdo6b05leWJ4T8aXLejwiSAg3rVuHiIkiyPqMBN
         pcXlic+BFgfbA7Tpu4MkbMDPRlSLca7+/q4HwHfPzCj3FaiQ+0I9TaAEoohxNTi6C7ma
         onow==
X-Forwarded-Encrypted: i=1; AHgh+Ro32hIxsvSLOObcxvwqUhrskKMzVkP+ySzYYiYQJVVo0KTN55RZ+9Jqu3bPjfvVdrLGIui2/YsjC4fA@lists.linux.dev
X-Gm-Message-State: AOJu0YzjcC2LAaz/ihmL1CMCe7d65NaNgsrJk6VAdWOal9JJqPdHj3dP
	qXl3ddzSzkncHowkMXa6uh0YonPbiQ4QnXiWWQ7goeYojDeOKUYiXyAl9eOZQlvxl39iiibkQYt
	+QZIrdmuCd79BdA2QmotKBKSdp8rK5cItPMoWk5Qj
X-Gm-Gg: AR+sD12J3wNrm2FWCGtIuQPiai/EvrwO7Ps7B8YiMKBgc73Ia1cTac2I6UOL6NJa+3U
	AkGni0orkZbjS9sGhuv55j6J0v+Zl1jsrJKC2aLgJTuqR7C6xUH/c7igvlWk1Lx7xbPHhFL5MS+
	jxDrynVbTHcN0QzJzOfzDRo0RH9xzXUk1UG3sUfT9ektPsgbdctN4AjKsMd9TbA+e/zUIQzvE+X
	bXLroSoBe3tgFdTY7y4rDZlo0jswj8O7/PbuHsf9R8wWzya5n2Z1+jNe8Ql0CgHm6vr8ChueGVA
	S4Q4OqRrJX7NLE7WAOhmVJ1FKSTI0jBNR/GvSGwWMCPJofW/DMcU3RH2+IWhy23vcrqs/nvddHv
	s6IJtG6FTujA=
X-Received: by 2002:a05:6a21:9f10:b0:3b4:931c:3c7c with SMTP id
 adf61e73a8af0-3c92a7bb452mr15042590637.44.1785851181842; Tue, 04 Aug 2026
 06:46:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 06:46:21 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 06:46:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <amzIckjuwf0JfINI@google.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-1-35f9aec2aed2@google.com>
 <b78bfee9-29f3-4044-8ac7-f294b3cd0ad8@intel.com> <amzIckjuwf0JfINI@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 4 Aug 2026 06:46:20 -0700
X-Gm-Features: AUfX_mxGk5RmzD5OeFVHjblIz9X-b3hzxwJd1etRfElQwBfbfA_qJlZkICUGG7E
Message-ID: <CAEvNRgGJ4DQuOVafc8ipd8NGP+6y=dcwSZPGOjtrHBAGO7sB9g@mail.gmail.com>
Subject: Re: [PATCH v9 01/41] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
To: Sean Christopherson <seanjc@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jul 31, 2026, Xiaoyao Li wrote:
>> On 7/29/2026 8:35 AM, Ackerley Tng via B4 Relay wrote:
>> > From: Sean Christopherson<seanjc@google.com>
>> >
>> > Start plumbing in guest_memfd support for in-place private<=>shared
>> > conversions by tracking attributes via a maple tree.  KVM currently tracks
>> > private vs. shared attributes on a per-VM basis, which made sense when a
>> > guest_memfd_only_ supported private memory, but tracking per-VM simply
>> > can't work for in-place conversions as the shared/private status of a given
>> > page needs to be per-gmem_inode, not per-VM.
>> >
>> > Use the filemap invalidation lock to protect the maple tree, as taking the
>> > lock for read when faulting in memory (for userspace or the guest) isn't
>> > expected to result in meaningful contention, and using a separate lock
>> > would add significant complexity (avoiding deadlock is quite difficult).
>> >
>> > Co-developed-by: Vishal Annapurve<vannapurve@google.com>
>> > Signed-off-by: Vishal Annapurve<vannapurve@google.com>
>> > Co-developed-by: Fuad Tabba<tabba@google.com>
>> > Signed-off-by: Fuad Tabba<tabba@google.com>
>> > Signed-off-by: Sean Christopherson<seanjc@google.com>
>> > Tested-by: Shivank Garg<shivankg@amd.com>
>> > Co-developed-by: Ackerley Tng<ackerleytng@google.com>
>> > Signed-off-by: Ackerley Tng<ackerleytng@google.com>
>>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>>
>> <...>
>>
>> >   static __always_inline struct gmem_inode *GMEM_I(struct inode *inode)
>> > @@ -60,9 +68,25 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>> >   	return gfn - slot->base_gfn + slot->gmem.pgoff;
>> >   }
>> > +static u64 kvm_gmem_interpret_entry(struct inode *inode, void *entry)
>>
>> Ummm, I'm not sure on the name. It doesn't look like KVM's style?
>>
>> Maybe, just kvm_gmem_get_attributes()?
>
> +1000, "interpret_entry" is extremely vague.

Was a little stuck with naming, my frame of mind was that "entry" is the
attributes, so I can't get attributes from attributes. After you pointed
this out, getting attributes out of an entry makes sense.

Will rename to kvm_gmem_get_attributes().
