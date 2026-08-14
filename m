Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C4BF4F1
	for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 00:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786665923; cv=pass; b=RejfWC45p0GpjdIYz1Ab7dS4LamR6lUv/PF3dT+gL/0eOEowjzcwAdMm3Mr6Rwy6TLFP6a+cTql6kZ5vHi7aOKtOBadAvmbE4Zv2cgnpJ3unvS9WqaRQsW1ZnWo+sMUnL0KySB5gR6wCuzCtpYfLX7QRfELvjnqwFzCMT8laJB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786665923; c=relaxed/simple;
	bh=ZgGzM+zjl+BHjjeXMPY/ag8Ox5OuAfFJuhyL7H+V3Q4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoFW7zeBIGK9PF665LIDQkdYrmM5D1kHKSG6dobvQ7pl4eXGq07w4whgY4KTa7pUF1s6t+dvRi7Z8/16ICbtjWuSUed9wbFmEB2eI2QFrAvriKvBY+NQ6FKSp8svzQyzCO/Ea8yN5giYBQNBp0V3LEcmK5pWXz8MhLakAdBdg6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qEcdaGo+; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qEcdaGo+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc73e322dbso8587785ad.1
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 17:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786665919; cv=none;
        d=google.com; s=arc-20260327;
        b=LdTigiGrSSzEw7B9nd68xb9JCueByVeBWMh3QhJ4YjyQNjFp5Vxa7X/+9AGuwC5Bvj
         cnmU+5OJi1U5PJVDMH+T4GFOLtBOsRsceRHzo/66nonArhe9xKDP8zZD4UUI7wI67Lbt
         SzYFV17Y5v4lNDNHEQqIK4S55d//sz/KxBcYh+Jzp1a9T0Y+TtgttNJeKZ9L9lyKX8K1
         g0EuEGvC4qUp5Gv8sYIv6qlgv5lboEn++sWMWVz+zGjmBRe5CrzI5VXxOcAovSZv1xn1
         VsDGgAB2DqUqBXFtFKG3lympdMLJ5+KFKRguQEjwv2ToJF3EipzMj5KxcyEKcaybRBsB
         VsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=6S8FmXxg5lAUAXg0md8s6VEd12Y3z7y8v3Uv1Qtefa8=;
        fh=4ehkafi0bmCymCAwnVefWnpa9+FeOMcxksSX6uoCXqo=;
        b=pVl3edUC4b/3YMqtT/z0GRKK6UGKqHkO1tiZ+Xc9b/afFnX6eJXqdt76inQjumKOWb
         R0OPOVw9RPYP/59DgOcb0zEQb/QpvJiLGficQzEYM/BfUJeS+rPkk7GiY215fsjpCKXA
         QgUdCIRKszlH9yNQyBSNxu9OPArtcOZ87qtOQXGeFWRNyqjIWPgrkaIbNhOTxNPTf+wR
         xNAy3bKS3H/DUDcuaSaQsA+xsk3FbeG8xkJ+CnyFl5zPTBwO518ewHYxZkf232hmtufx
         PYlm7Sd9LaI1tcTnhnLhmlK1HPgG0Yp22Ci3bBR0vfFdfFihWt+CT6flnty3lEY49Uot
         D3Rw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786665919; x=1787270719; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6S8FmXxg5lAUAXg0md8s6VEd12Y3z7y8v3Uv1Qtefa8=;
        b=qEcdaGo+ywRD55cDeae2D+SzWM7MhHP+1zhZzgRrZQyov8tHCvhj/mijGS16rCavY9
         2Ni5CjsTVr40ZYCpsgBas+dUk2HGTIw/ld0AzxibVr/ex+VK7HcG2vIFes9A9rq2ypxj
         0kkEvVTa3MzA1VksYxFyWN1TCtDlxxRigWzAcsayCnTVAET/kLcJEuBMAo+iTDl1tRva
         lE3rrl0iNIo2V81I7xYQzS19IP9sKOvPRe1NmIzPEHexu9tv4hR2QVjFzqgKAyAXyZ6Z
         M3EbTln89J0xwYx8ad6RWZNd4w+2lNS2BjaZUelQejNrcurdoi47Glb46vnSvHaNps1z
         BI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786665919; x=1787270719;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6S8FmXxg5lAUAXg0md8s6VEd12Y3z7y8v3Uv1Qtefa8=;
        b=T+UJZYZOrAJE1XhVgZihA8BwFM+M1jsfPie7+ndt5x8TVb6IMSnwuS1Sjr3TfFlWk1
         K7gBa/gEQki5E3p0fgCQ0FV1mO9HeU6qpp9WlWYLQiUSBo8U8b79Et53ZPviJ4qdXpwQ
         uP+Zla2XDlHWts9Vjsc7+xTrePTDnd0QKL8Od40J3j8+ZtSaTg9uJ7SBtVgfONZMjkge
         e5a66nYcdcVCeUOKTXtBvO6bekJqhlL+55Aqx4eNITR+7VHD+Lt9eQajeuu4KUyiXoXW
         3GeSlqDkKMgTT1yvhJiYNPe7pQWuQbTwFIVVALcVqxuqGeeWAnfe6WXfpnyp/H7uqiro
         pctg==
X-Forwarded-Encrypted: i=1; AHgh+RqlZtxwtPyGRvUwoFZ65Gw3sh5tkeUuOs0rQBgOpyHd4WsMYYFMBzVQF+x6UdO3IPMpkGpgYCQXWNzS@lists.linux.dev
X-Gm-Message-State: AOJu0YzlPno+vOTcidXGcZrgPoJ2O9uqG+qtG26E/gf/+yeZHjeI7IL+
	sKckqBbFy2IpadVuTXW5blosrr+MYwqTqGk0uCCiJt9dGomKls3yP/4Wtw2C3iELGXhxLAFUN2P
	9IM8tTFx5ZaiCyqLA8LDJMEwlRGEeTGnk3cYe9RIs
X-Gm-Gg: AR+sD11et4gIWo8vvS5Dy1IPs0qpbdUwsuIN5NvNMO+BVHaCAOnHpKI4WAt9TsQ1V41
	HxrradflI0iw5MYXjEI0oLKW7Pm2nDhkq1AwkMgRaCWSHDlKUUi6OJnNj/AFfX1AJB3FQuY0rNq
	nXGxs/STukfTjetNNRCxFIhUpTr7mguWSQFM1mXR7JRvr5e6dQTDZjrTSiGIYWV623Oa7iG8ATI
	pSLNe8VCX+VeAAwJPEucHZ2/4VRD0MRtF5HesYHWI0VGLNcH07aDlZw0Xs8/dJ105KLE0r6DbXg
	mk3PMSAbsMSgIeKj+TQH9KhYzqrkMWmanmjpBszvWXBD576qUbNn5Tn12ThUanJ0/TIaTI7VxqL
	2YRbf1KbyUfRZe3/jheldFkZqV49QVO6vLUpoJMc0tbdqBw==
X-Received: by 2002:a05:6a21:4cc7:b0:3c3:66c5:68cc with SMTP id
 adf61e73a8af0-3cc71fa8eafmr1715323637.21.1786665918897; Thu, 13 Aug 2026
 17:05:18 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 17:05:17 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 17:05:16 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <an5AcEG9mqDgnBYk@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-12-2fc18ee6d3ba@google.com>
 <1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com> <an3o4h-E8mj6CUaM@google.com>
 <CAEvNRgGpCVCGVjc9jCt9Yr+XypF=71h6eBahkXNkrXhfrtGY+g@mail.gmail.com> <an5AcEG9mqDgnBYk@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 17:05:16 -0700
X-Gm-Features: AUfX_mwNyds6nxIp7br0Dvgux1SWKykTqrMhXPSN-3v_34SJDBU412XbJ-YOoSs
Message-ID: <CAEvNRgE+05c9U8C=Zkm1S9hLw3Lw6YMmijZhEe7J4rYQAuNyEw@mail.gmail.com>
Subject: Re: [PATCH v10 12/41] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
To: Sean Christopherson <seanjc@google.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, aik@amd.com, andrew.jones@linux.dev, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Aug 13, 2026, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>
>> > On Thu, Aug 13, 2026, Binbin Wu wrote:
>> >> On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
>> >> > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
>> >> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, pgoff_t end)
>> >> > +{
>> >> > +	struct folio_batch fbatch;
>> >> > +	pgoff_t next = start;
>> >> > +	int i;
>> >> > +
>> >> > +	folio_batch_init(&fbatch);
>> >> > +	while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
>> >> > +		for (i = 0; i < folio_batch_count(&fbatch); ++i) {
>> >> > +			struct folio *folio = fbatch.folios[i];
>> >> > +			pgoff_t start_index, end_index;
>> >> > +			kvm_pfn_t start_pfn;
>> >> > +			kvm_pfn_t nr_pages;
>> >> > +
>> >> > +			start_index = max(start, folio->index);
>> >> > +			end_index = min(end, folio_next_index(folio));
>> >> > +			/*
>> >> > +			 * end_index is either in folio or points to
>> >> > +			 * the first page of the next folio. Hence,
>> >> > +			 * all pages in range [start_index, end_index)
>> >> > +			 * are contiguous.
>> >> > +			 */
>> >> > +			start_pfn = folio_file_pfn(folio, start_index);
>> >> > +			nr_pages = end_index - start_index;
>> >> > +
>> >> > +			kvm_arch_gmem_make_shared(start_pfn, nr_pages);
>> >> > +		}
>> >> > +
>> >> > +		folio_batch_release(&fbatch);
>> >> > +		cond_resched();
>> >> > +	}
>> >> > +}
>> >> > +#else
>> >> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, pgoff_t end) {}
>> >> > +#endif
>> >> > +
>> >> >  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> >> >  				     size_t nr_pages, uint64_t attrs,
>> >> >  				     pgoff_t *err_index)
>> >> > @@ -599,7 +636,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> >> >
>> >> >  	filter = to_private ? KVM_FILTER_SHARED : KVM_FILTER_PRIVATE;
>> >> >  	kvm_gmem_invalidate_start(inode, start, end, filter);
>> >> > +
>> >> > +	if (!to_private)
>>
>> Should I make this condition
>>
>> 	if (!to_private && kvm_x86_ops.gmem_make_shared)
>>
>> instead?
>>
>> Will that help?
>
> No, because that's bleeding x86 details into common code, which defeats the purpose
> of arch hooks.

Ah okay yup maybe it should have been kvm_arch_has_gmem_make_shared()
that defaults to false and x86 will return !!kvm_x86_ops.gmem_make_shared.

> That's why I think it's worth analyzing the cost: if it's in the
> noise, leave it alone.  If it's meaningful, figure out a not-too-gross way to skip
> the entire thing if kvm_arch_gmem_make_shared() is a glorified nop in the end.

Is noise defined relative to the entire conversion process? Would this
benchmark look like

1. Convert 4G to shared on TDX with CONFIG_AMD_SEV defined
2. Convert 4G to shared on TDX without CONFIG_AMD_SEV defined

and then compare the difference in time taken?
