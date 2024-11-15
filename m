Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391C91B4F0A
	for <linux-coco@lists.linux.dev>; Fri, 15 Nov 2024 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731668346; cv=none; b=YeDhg1J/f/J2tJY2MqKVAUjTBx4iB00rASiMC5bhzYo2j6mMIJ3RTCyceQX/p4fPz/DoX26V9ek1+EuBWJcyzxy4K2Udm7kyD0Ooc0dbATSf6UB1OI5+2lSaGeJeN8jB48/JRLt36qywwA8JDGeehfD2lL5+DEdq9+oiFXFVPWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731668346; c=relaxed/simple;
	bh=xk5IraDmxNndGfJynhHEOWE4Z0wHW2Kmk6du6iWp3R4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y9eqME+eFeiMlNsFUS5dpe5k85eyDKIo1OfK6ma+JaKoLpsiRrGBV+dQU7cc34Dw8SIZtmQn6Kj00YekzPCEY9SfDttzNKNIC3N6/RgxAqX7WWrUWOzV85DFkG3l6i1aXWyI48z4Cw4nYFIeYfGMram+tKrmqzxSg2DGRh/HHAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ai7N5Vyk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ai7N5Vyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731668344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LZA42ddjo8PCNzqC2RzA/0ngU7rvGCooWJ2X5VJm9io=;
	b=Ai7N5Vyk6eAaCuoy2L+Yxq6kvqZ2KHUowXhtwman9+kfHtjGEPu/I75LddWk5vdOOvgjln
	c7GwNUsaogxBmJpL/7fdXWWrXF+YsFxRDJRAEttFYoVa0/psGTBlo7/e65hsHC6EVfhppH
	YeN1eDFLH83IeY2DSf2fphL6+TnCY2I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-cahLiGW9Np2rcaAUnI_k6w-1; Fri, 15 Nov 2024 05:59:03 -0500
X-MC-Unique: cahLiGW9Np2rcaAUnI_k6w-1
X-Mimecast-MFC-AGG-ID: cahLiGW9Np2rcaAUnI_k6w
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43151e4ef43so4098135e9.3
        for <linux-coco@lists.linux.dev>; Fri, 15 Nov 2024 02:59:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731668342; x=1732273142;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LZA42ddjo8PCNzqC2RzA/0ngU7rvGCooWJ2X5VJm9io=;
        b=Yaskx+aedzypIFdH/9F1/Hi8KTX3YfamecIpRcMg+sW8uMuXZ+7ZRLbOXG91DRrmtY
         rQV2xEm7B2tF6cLz0lFQkf2ct66yZmFRPGJ0bUIRXihokLZuwByq4fdImCM1eD9O1gLx
         +t912D23uqCQoE9D/TH1Gbv2SVpIH0mc9G5MfA4My0nXMBmZPG+VdyXm3dS2Au2MPKKP
         WSSLqcilcmmtyqSv3ROkCR8hD9TtGq+akBt/wR0mELnzTztZM8irhXgWuCmizU7JOH7I
         kCBrYDDveXzXX6e6rspTKnVI/ocDWug7g6NO12P6W60oGHhmfdFhrjR3yZj/mzYpNBE3
         Zy+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOCD8Z4avgO2pyucHPZ+382eUxeMVMcFnL+BjNvYZxYo9eOAMR4XDw8oMh3TCsFJx2p9d6tBqjaIc1@lists.linux.dev
X-Gm-Message-State: AOJu0YzU2fuC/DFfn0H76r70L6PDN/2ihKo+ZgazrOweYCOls0O7Glob
	00raiOt9/K3Jp2VFx/BVBaiIlvzf2QCA6yFtbmYRJpzznM3UwoJDQAHPs5JV5X3YmlL8E4eoeHF
	fKDs/vKa9X53hxd4p/ZhDIvzDi0DjlZuDJQQfF3IoMna/pmr1VMckQQkEsx0=
X-Received: by 2002:a05:600c:1548:b0:431:6060:8b16 with SMTP id 5b1f17b1804b1-432df792d1fmr19751715e9.30.1731668341632;
        Fri, 15 Nov 2024 02:59:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEV+H1DNqNgOXQeADtTDfnSZodbTJi6jL/FAZvevlXL9pc+wfCJzI7z7EhCdXSHK1J85QtjQ==
X-Received: by 2002:a05:600c:1548:b0:431:6060:8b16 with SMTP id 5b1f17b1804b1-432df792d1fmr19751485e9.30.1731668341187;
        Fri, 15 Nov 2024 02:59:01 -0800 (PST)
Received: from ?IPV6:2003:cb:c721:8100:177e:1983:5478:64ec? (p200300cbc7218100177e1983547864ec.dip0.t-ipconnect.de. [2003:cb:c721:8100:177e:1983:5478:64ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d48baa42sm66969915e9.1.2024.11.15.02.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 02:59:00 -0800 (PST)
Message-ID: <d2147b7c-bb2e-4434-aa10-40cacac43d4f@redhat.com>
Date: Fri, 15 Nov 2024 11:58:59 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/2] KVM: guest_memfd: Convert .free_folio() to
 .release_folio()
From: David Hildenbrand <david@redhat.com>
To: Elliot Berman <quic_eberman@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>,
 Ackerley Tng <ackerleytng@google.com>, Mike Rapoport <rppt@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Matthew Wilcox <willy@infradead.org>
Cc: James Gowans <jgowans@amazon.com>, linux-fsdevel@vger.kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241113-guestmem-library-v3-0-71fdee85676b@quicinc.com>
 <20241113-guestmem-library-v3-1-71fdee85676b@quicinc.com>
 <c650066d-18c8-4711-ae22-3c6c660c713e@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c650066d-18c8-4711-ae22-3c6c660c713e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iyxytmS_Krk5IP9S01mRmnpsxbWGTLgS-7JjZT9CQL0_1731668342
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.11.24 11:58, David Hildenbrand wrote:
> On 13.11.24 23:34, Elliot Berman wrote:
>> When guest_memfd becomes a library, a callback will need to be made to
>> the owner (KVM SEV) to transition pages back to hypervisor-owned/shared
>> state. This is currently being done as part of .free_folio() address
>> space op, but this callback shouldn't assume that the mapping still
>> exists. guest_memfd library will need the mapping to still exist to look
>> up its operations table.
> 
> I assume you mean, that the mapping is no longer set for the folio (it
> sure still exists, because we are getting a callback from it :) )?
> 
> Staring at filemap_remove_folio(), this is exactly what happens:
> 
> We remember folio->mapping, call __filemap_remove_folio(), and then call
> filemap_free_folio() where we zap folio->mapping via page_cache_delete().
> 
> Maybe it's easier+cleaner to also forward the mapping to the
> free_folio() callback, just like we do with filemap_free_folio()? Would
> that help?
> 
> CCing Willy if that would be reasonable extension of the free_folio
> callback.
> 

Now really CCing him. :)

> 
>>
>> .release_folio() and .invalidate_folio() address space ops can serve the
>> same purpose here. The key difference between release_folio() and
>> free_folio() is whether the mapping is still valid at time of the
>> callback. This approach was discussed in the link in the footer, but not
>> taken because free_folio() was easier to implement.
>>
>> Link: https://lore.kernel.org/kvm/20231016115028.996656-1-michael.roth@amd.com/
>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>> ---
>>    virt/kvm/guest_memfd.c | 19 ++++++++++++++++---
>>    1 file changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 47a9f68f7b247f4cba0c958b4c7cd9458e7c46b4..13f83ad8a4c26ba82aca4f2684f22044abb4bc19 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -358,22 +358,35 @@ static int kvm_gmem_error_folio(struct address_space *mapping, struct folio *fol
>>    }
>>    
>>    #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
>> -static void kvm_gmem_free_folio(struct folio *folio)
>> +static bool kvm_gmem_release_folio(struct folio *folio, gfp_t gfp)
>>    {
>>    	struct page *page = folio_page(folio, 0);
>>    	kvm_pfn_t pfn = page_to_pfn(page);
>>    	int order = folio_order(folio);
>>    
>>    	kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
>> +
>> +	return true;
>> +}
>> +
>> +static void kvm_gmem_invalidate_folio(struct folio *folio, size_t offset,
>> +				      size_t len)
>> +{
>> +	WARN_ON_ONCE(offset != 0);
>> +	WARN_ON_ONCE(len != folio_size(folio));
>> +
>> +	if (offset == 0 && len == folio_size(folio))
>> +		filemap_release_folio(folio, 0);
>>    }
>>    #endif
>>    
>>    static const struct address_space_operations kvm_gmem_aops = {
>>    	.dirty_folio = noop_dirty_folio,
>> -	.migrate_folio	= kvm_gmem_migrate_folio,
>> +	.migrate_folio = kvm_gmem_migrate_folio,
>>    	.error_remove_folio = kvm_gmem_error_folio,
>>    #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
>> -	.free_folio = kvm_gmem_free_folio,
>> +	.release_folio = kvm_gmem_release_folio,
>> +	.invalidate_folio = kvm_gmem_invalidate_folio,
>>    #endif
>>    };
>>    
>>
> 
> 


-- 
Cheers,

David / dhildenb

