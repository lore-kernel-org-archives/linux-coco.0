Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBF71EF088
	for <linux-coco@lists.linux.dev>; Fri, 14 Mar 2025 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944802; cv=none; b=MppYe3xIZK6PChsQgevtE9FJOb/a7hehq182H5IreomTnAUF99fSuPZHylUW+cZDpbVoBLUr3fRLNTXkTWSPRlZsepyK1v8SB8Djs8W1PH6rAMqHBSbak66yEUY9QNfIB3azfqGN72zAxV+SYgSUffSrzELbx0WCmteBtJfuh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944802; c=relaxed/simple;
	bh=jRvSQnR5WlpmJDJ5I3vj9NBji+NiyQe734v/9qpFQIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVDPU/pZsJYdq0vb8ISqy9pwa7hZPS5iD+0iY6CekkjEsq9BsLotn18cTKLdWO/qFzNfYEekuSvU724tUKJ0svL1uO8GYvP6YPmXHj5+Hmao+1SHCwb7jvGoMn/nvU5JQnN90hdwsrK+EcszGvYsUVKC4QYMy9J17D+i0uP7FFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QeVNk9Pa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QeVNk9Pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741944796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kr+GM52HOX7QpsfoABLNv8i9AtL+eNgSpKohidSEYe8=;
	b=QeVNk9PaeebVLEpBq9H5PJI1u9vS0c29R9N9ZOb5GQKloOSLWguRWdfHLrOHfY4wzbwkh4
	8Pq2xWg2WbpTtZlMMrobHZwWmYTnMhM2dnLGcJw6uD8ByeXzuiJjSiU83IunqLkeeiUwcB
	HtKk5lNsd4PcwM4oBHVPg1ZWE9Karjw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-VqX0_5SnM-SEk4AKuMTAGQ-1; Fri, 14 Mar 2025 05:33:11 -0400
X-MC-Unique: VqX0_5SnM-SEk4AKuMTAGQ-1
X-Mimecast-MFC-AGG-ID: VqX0_5SnM-SEk4AKuMTAGQ_1741944791
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso10978665e9.3
        for <linux-coco@lists.linux.dev>; Fri, 14 Mar 2025 02:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944790; x=1742549590;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kr+GM52HOX7QpsfoABLNv8i9AtL+eNgSpKohidSEYe8=;
        b=NEAytP+KYuOUL0QQxq/6c6OLB9T+43Wwhw7gZMnSaKKdprrImldcoLfr/GwsFJmpvS
         2cBRXV6yiNzyASAEzRkMwbkRMxds5G6w+i9PfMBirSnkjLtF0RXqLxUbZBCbQpTDBrkH
         fCcmg/CCQTi4OYGJey3fABOCobtjqMpDNBw8rJa0OKa6x+RKr83jStsFVSTg4s/pk5xv
         jb4VifFL22GR6R2cFHYO7H8n3MSPty/VcMcL1in37XOzV+GJ4F2xeODn6x35J9Cua/Ad
         UJLKlU6fJ2AoqEKVZr9C9xvP1/lKeTk78rXqzX/I6u6rhSrF860I3bIn4EPSDDFMnK9O
         tWMg==
X-Forwarded-Encrypted: i=1; AJvYcCVNkCrL5danNKUqXYmkFavrPfNdCcszg17Xxd4LOLXhrxMi8yO3dqEyd0Fz/QSzbR7IGrdJcX0nk7Yx@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8aERqm/lOrwMkCFsb+i14tVCkkpVHGqHlEUWFqQflgwm6U+L1
	OVnL/jRPHx1TURnfWB6PmaRaKj6MlwWY7uEtiDfIk2euxFOmbGe/cs9qGq5eIBENMWPUrtyt765
	gpPF32KCg9aZgOavkOF9nxu0zZ6VFMBZmPxgvnKGOZF+jvn5AgbOaReAzEDk=
X-Gm-Gg: ASbGncsqpAw0+JxikkKhGDQwLGXIpnDdXoX/ZIXwJOscJkECMfuetk7jE4d06uwMhQe
	pJMpAiqEgegBXBUqrwcFgO2POdxdbs5lt3aUFdOY9SApqjdbDJSzmXz0iBv5jc0tO6GWZP4jSVL
	9H14wo0yB3Fqkd57zGecFpL6bGueUMymJZ4YXv6DYm7Jwrpo4E6CGkjXF3sU7+naAfOe7OlCZOg
	0C0EzdPQC4MDWEpMvmHqQLRuYYU1rByN4hPbr1uE+ft3G4JhEsj/7rMiEjDsu9+IMySCai8yk1a
	jKjd1Y5Ez7dPDrsYzBPJTni9fI+Jq+e+0lx6LIDSbH2q3Tc4aAufs+X5PaTB4iXg37audMXgmHQ
	Q6ym98kOg95dOxTUETYL5BVLI93rLFypI6zfSP999ms0=
X-Received: by 2002:a05:600c:510c:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43d1ec90beamr23184155e9.3.1741944790584;
        Fri, 14 Mar 2025 02:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxZxe66PEHA3sRublZ+jKCA2QM/pZrwH4q+h0r2rqv07VI5Vyt2jEI2LSjNPPj9D5cOHGJUg==
X-Received: by 2002:a05:600c:510c:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43d1ec90beamr23183865e9.3.1741944790191;
        Fri, 14 Mar 2025 02:33:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:2000:5e9f:9789:2c3b:8b3d? (p200300cbc74520005e9f97892c3b8b3d.dip0.t-ipconnect.de. [2003:cb:c745:2000:5e9f:9789:2c3b:8b3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe2a2c8sm11664425e9.23.2025.03.14.02.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 02:33:08 -0700 (PDT)
Message-ID: <18db10a0-bd40-4c6a-b099-236f4dcaf0cf@redhat.com>
Date: Fri, 14 Mar 2025 10:33:07 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 0/5] KVM: gmem: 2MB THP support and preparedness
 tracking changes
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "Shah, Amit" <Amit.Shah@amd.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Roth, Michael" <Michael.Roth@amd.com>,
 "liam.merwick@oracle.com" <liam.merwick@oracle.com>,
 "seanjc@google.com" <seanjc@google.com>, "jroedel@suse.de"
 <jroedel@suse.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "Sampat, Pratik Rajesh" <PratikRajesh.Sampat@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "vbabka@suse.cz"
 <vbabka@suse.cz>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "quic_eberman@quicinc.com" <quic_eberman@quicinc.com>,
 "Kalra, Ashish" <Ashish.Kalra@amd.com>,
 "ackerleytng@google.com" <ackerleytng@google.com>,
 "vannapurve@google.com" <vannapurve@google.com>
References: <20241212063635.712877-1-michael.roth@amd.com>
 <11280705-bcb1-4a5e-a689-b8a5f8a0a9a6@redhat.com>
 <3bd7936624b11f755608b1c51cc1376ebf2c3a4f.camel@amd.com>
 <6e55db63-debf-41e6-941e-04690024d591@redhat.com>
 <Z9PyLE/LCrSr2jCM@yzhao56-desk.sh.intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z9PyLE/LCrSr2jCM@yzhao56-desk.sh.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KxnIu-9GAbm3oci5u7L5ZQeMqGpNX71IkXnlzuBY340_1741944791
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.03.25 10:09, Yan Zhao wrote:
> On Wed, Jan 22, 2025 at 03:25:29PM +0100, David Hildenbrand wrote:
>> (split is possible if there are no unexpected folio references; private
>> pages cannot be GUP'ed, so it is feasible)
> ...
>>>> Note that I'm not quite sure about the "2MB" interface, should it be
>>>> a
>>>> "PMD-size" interface?
>>>
>>> I think Mike and I touched upon this aspect too - and I may be
>>> misremembering - Mike suggested getting 1M, 2M, and bigger page sizes
>>> in increments -- and then fitting in PMD sizes when we've had enough of
>>> those.  That is to say he didn't want to preclude it, or gate the PMD
>>> work on enabling all sizes first.
>>
>> Starting with 2M is reasonable for now. The real question is how we want to
>> deal with
> Hi David,
> 

Hi!

> I'm just trying to understand the background of in-place conversion.
> 
> Regarding to the two issues you mentioned with THP and non-in-place-conversion,
> I have some questions (still based on starting with 2M):
> 
>> (a) Not being able to allocate a 2M folio reliably
> If we start with fault in private pages from guest_memfd (not in page pool way)
> and shared pages anonymously, is it correct to say that this is only a concern
> when memory is under pressure?

Usually, fragmentation starts being a problem under memory pressure, and 
memory pressure can show up simply because the page cache makes us of as 
much memory as it wants.

As soon as we start allocating a 2 MB page for guest_memfd, to then 
split it up + free only some parts back to the buddy (on private->shared 
conversion), we create fragmentation that cannot get resolved as long as 
the remaining private pages are not freed. A new conversion from 
shared->private on the previously freed parts will allocate other 
unmovable pages (not the freed ones) and make fragmentation worse.

In-place conversion improves that quite a lot, because guest_memfd tself 
will not cause unmovable fragmentation. Of course, under memory 
pressure, when and cannot allocate a 2M page for guest_memfd, it's 
unavoidable. But then, we already had fragmentation (and did not really 
cause any new one).

We discussed in the upstream call, that if guest_memfd (primarily) only 
allocates 2M pages and frees 2M pages, it will not cause fragmentation 
itself, which is pretty nice.

> 
>> (b) Partial discarding
> For shared pages, page migration and folio split are possible for shared THP?

I assume by "shared" you mean "not guest_memfd, but some other memory we 
use as an overlay" -- so no in-place conversion.

Yes, that should be possible as long as nothing else prevents 
migration/split (e.g., longterm pinning)

> 
> For private pages, as you pointed out earlier, if we can ensure there are no
> unexpected folio references for private memory, splitting a private huge folio
> should succeed. 

Yes, and maybe (hopefully) we'll reach a point where private parts will 
not have a refcount at all (initially, frozen refcount, discussed during 
the last upstream call).

Are you concerned about the memory fragmentation after repeated
> partial conversions of private pages to and from shared?

Not only repeated, even just a single partial conversion. But of course, 
repeated partial conversions will make it worse (e.g., never getting a 
private huge page back when there was a partial conversion).

-- 
Cheers,

David / dhildenb

