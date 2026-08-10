Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8C6437455
	for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 21:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397350; cv=pass; b=rqKmg9fNgb3iW03LNERC2y4+FCQOIz3uwJXks8LesW7IMMVV+PCPL9tbevY84owSFfVO0KDDuVKMeSdto4ZZkF6xUzuV3RrYhoUFgXuIJQeG6ltT122++wNte9NPOwP1bLvA6GsURIMaB4PA7IyDpqp5NwwVPgAh+ar/NjDPkGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397350; c=relaxed/simple;
	bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3cP9MHvrBwfYdcdcuHEdN/snkC9EDx12OXOqjqA3weDPz1J/shA6FplRPWph3XkMnSLTVnw7y76092eMJy5BvBONKW67YultInpYJm4Z7rCRW17Nk20VSRxe0MnWt6v8n2X1cJ30KJ7Qt1rjwuI+MoUVDgE1ZFEGcgJnImjK7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Siy7TGOg; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Siy7TGOg"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so197793a12.0
        for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 14:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786397348; cv=none;
        d=google.com; s=arc-20260327;
        b=GPAm9X+Vc9qf6gdigssJXlT62mxHs8H4TBnraJMACsWK+k49dVwJpenwUdhp5VO4S2
         D6kqVkJsYDxLdgqlNqcxC8AnDy7rhszpFoBOs1Nf6cchZ2JWzf4KxDJD2wOpfjF1GLLF
         MACOBJRXOwQQetcFWK0HGvaNIg842oQIe2Z4EmHLp5cqat3HPBRCNjVwGFkjDgIGzbLb
         Ge7rtSoU9ib3l2YSt3An9DksPgaSDvDzEODy7VQxwOMRqlv17q8sAmmvIzPdzEEAoOZF
         zZBFrUcuNe1S3DKRd54FRrx3LDy3F/59nZ3tsmR5ewdjHn9ulbPSPbERWNZ9tslHTGQY
         WexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
        fh=eNxd2tp7mUi9zxqjY8XUcRJugN2tBc12AUbAZosO29M=;
        b=X7fxFPuvCxAELP5OwdYokjA5uCJ1LE71nI9Cej69b3n6UXzfdwPsSFpUQ/20rOsnym
         GHrz6Anzh79VAScamPWhDDuhmnYwZWazUAlth+3jcLTIuHN8E+N8MBopRMMNvF5zP3Mn
         /WJr5hZZRGOvMHkLGapi3yM1GEF7NQgKv5ZmLaOXlBPaxy3bfSP/IGVng6AYfi+OWeHu
         NVw++36qqpfTkeWnYoep9Fda9VimpJes3GtJkL9g/ESPP2cVrwL7d6HNdiEfl+CgzcfN
         Z0QTf5sBFa1TRaTwmpwE2ta6Sl9BoFxuyv7AsHmWB7hVLglTv6OFV6AxcibqidOAfEbO
         fqpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786397348; x=1787002148; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
        b=Siy7TGOg2Raw7Mdgu1sJJD1zzsjWTTINLapZFquVhE6c/On+quCZvLWbwugqmpJM+T
         pVzj82XaXQ6zgkE0luk3k36loO/rfkxVCWE0jZayFBcPTgPqC673Di8aIOq+EyfIc7GY
         9J6QwzkDNwFRhmJ0BdR7kOVETKxYIyyckWL3HaBkR0bf5Z22V2cIvazSwYcsGL/YtotN
         WXwUMovMlUZhEoTEGGNnH25trScRPEXiQqf8F4c5MqYL2Q65dRyOjJu8QAfb9/Ybwz4G
         NfqhIDFPbILEOdxeM8RS+q/yFrSvXQme/wzSyJFmHCNMQFuBDWJJY0HTshi/KTKirAna
         IUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397348; x=1787002148;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
        b=g7XHwXOtohyMZfkHT0fod8BdGhQRu2UOxg42UBUSVtZHPgVNBh9cUdkWkGcEQ0P70T
         jt4yRuEx/xYqK8hV1hLH2oZq4Trg61NBC8+wzH4+Nz1V7txDO2E9fjJY7X7Li6wMg3Mc
         k1Z0i9pHZ99pUW8pF5yRlScDxXuIpxW9q0PdHOQTqso5JefI2bWH+SZNzk4intmfp2HY
         sKv4r3m13aPc/8KptNUwNS9rJ2fyrdjDQ/fFnB40Wr1oW2OhWf6NB3YLDiedm3WmHWEk
         qUV+ZayQVBY+geGEhg4EyYUCLP2yle0eBy9kWpukETdv2HtPIY0ENsV6mBcwb3D/L9sC
         eTSw==
X-Forwarded-Encrypted: i=1; AHgh+RphXKIHmMNDl6eNpyzAkdFqS7jZYvb2hptVw1gnDvjS85EVuDS51Twk8QBpeM0gKdcfurqthFoHhglg@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz5C4J8EUMVuWUY6kT5OalD0m+YT3JG9HlXYNWRL9hfwx09H88
	dII4py4AUZ09PZef6UOt3xeKKbFEv9WMDlIGvZX10HsKhXGo8nplKQpMI1RpQdSv1opHhVeVH5A
	OqNBYKz0f4RbMbIicvnX4HuuRYluz+wniIbw8jypw
X-Gm-Gg: AR+sD11h76EYt9yMJXHDqLdSXgArBVTZBfcjoqbO46h5xLJIF2K112IBaOyPfcFEGq+
	k3lHhMc7wCxCtWhnUqepCHjD2t+qcFdz+5RBKujceM9BU3E/tiUGJzU1TnI9vp4Ot0ddrMfNcM3
	rAz57tPayFV53uT0fZ2B8ddInRfqo+p+Vm2gRTNudS874iJcXqFTathlIikM5VfaB8JhFAgX5lh
	9DkpNtGqvCKbuckkoMbmYXYkAs9ZbJsXG39kX7PvwFco0/k8EoTBVRqv8B2jzufvzZniw8inKsY
	Gp+cTZ+WEu7FU+hZBwKKfBNZ3a3hIbYte97KufvQC4YzYSTgP7FR+Fd8Zj3ibe3NHuM5RZjMJlb
	nhixEtW+3MYBUsUHsaB4X+wbNKj5ex9sV3Uk=
X-Received: by 2002:a05:6a20:4321:b0:3c3:b57b:6291 with SMTP id
 adf61e73a8af0-3cb85e6689fmr49405061637.18.1786397346906; Mon, 10 Aug 2026
 14:29:06 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:29:05 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:29:05 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aa545680-2fee-468c-ba34-cc9beb16f4cf@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-15-2fc18ee6d3ba@google.com> <aa545680-2fee-468c-ba34-cc9beb16f4cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 14:29:05 -0700
X-Gm-Features: AUfX_mxwV4sMMEn8xD5iLtETNHGAZsCJNscksNcNQT60_O-j0WNrenHXqsrVJ0k
Message-ID: <CAEvNRgFSdddvuT8ZJUPOC9BCAtBgx6Vk=UbbPZ0nTAz8M52dSQ@mail.gmail.com>
Subject: Re: [PATCH v10 15/41] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> A guest_memfd folio is safe for conversion if guest_memfd holds the last
>> references on it. Any other references on the folio may indicate another
>> user, and guest_memfd cannot convert it to private if there may be an
>> existing host user.
>>
>> A folio will have extra refcounts if it is present in a per-CPU lru_add
>> fbatch. guest_memfd does not actually participate in LRU, but
>> freshly-allocated folios are still added to the lru_add fbatch for batch
>> LRU statistics processing.
>
> As discussed, what would happen if we mlocked gmem folios? In that case, they
> could also have been added to the mlock cache (which we treat like an LRU cache).
>
> But that's just a comment regarding the text here.
>
> [...]
>

To make sure I'll get the wording right, let me know what you think of
this (will replace the entire commit message for v11):

 A guest_memfd folio is safe for conversion if guest_memfd holds the last
 references on it. Any other references on the folio may indicate another
 user, and guest_memfd cannot convert it to private if there may be an
 existing host user.

 A folio will have extra refcounts if it is present in a per-CPU lru_add
 fbatch. guest_memfd does not actually participate in LRU, but
 freshly-allocated folios are still added to the lru_add fbatch for batch
 LRU statistics processing.

 A folio may also have extra refcounts if it is on the mlock fbatch.

 These two known "usages" of the folio are handled calling
 lru_cache_drain_for_folio, which drains both the lru_add and mlock
 fbatches. After draining, if the refcount is still elevated, then
 there's truly some other user of this page, and the page is not safe
 for conversion.

 If the page may be dma pinned, DMA is obviously using it and hence not safe
 for conversions. If the page is still mapped after guest_memfd tried to
 unmap it earlier in the conversion process, it is also obviously not safe
 for conversion. Exit early to avoid unnecessary draining in these 2 cases.

 Provide a drain status to only drain once ever while processing a batch of
 folios.


> --
> Cheers,
>
> David
