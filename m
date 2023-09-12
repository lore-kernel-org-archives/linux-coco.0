Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA68E17723
	for <linux-coco@lists.linux.dev>; Tue, 12 Sep 2023 07:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694503114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+OodWnETEUgz5EFst9JGpxDf54xHXqhw04bLaPZH7zA=;
	b=CfJufZ0+jnXUOpY16coEfCS98QFO6LyZiJN9ZQMEe4HxCEEczHeF8QRji3hYNbeDMVubLi
	gHqDdWxKeZudQiHsUd87wPqpjxK1HDtphR7kFywyJrwBO45UzoqF2qdoKhL9doH/MrBHQR
	2veEcmGi/Pw8q2Awo+KXC6QZ231lHVg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-jnD2qAyEOgGlWQGiuY0nFA-1; Tue, 12 Sep 2023 03:18:33 -0400
X-MC-Unique: jnD2qAyEOgGlWQGiuY0nFA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4005f0a53c5so42468175e9.3
        for <linux-coco@lists.linux.dev>; Tue, 12 Sep 2023 00:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503112; x=1695107912;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OodWnETEUgz5EFst9JGpxDf54xHXqhw04bLaPZH7zA=;
        b=SjsqoUK4JDuN6i6grbltOQqFotwaoWuTywku8rBQJ0tslmQVCb+Ew+nCZGwahq3QVV
         /6+IbLs81YMoBGkbIF7Tj4atUVFhlRO1AF+lCCXxzi23qT8cB956P1MoWwFoSrTpClBS
         s4OkUNMoPpRXVjMHX4Hi/hGEaIXe/Xpgfc3dLwBmlx4WyG0XtE5jH1CJ9o5Z7Lk5lvFc
         FQd5V0W0QDw1dsjM/2XDM3W5uEJQzlFW7e+Xrl7QPFjZDRTe7QdC7S3cJZA+H045btMJ
         DExz3YyCfOOeWzf+LJaNevdf+b8+dGpFGDohGvHL15NAjX+OLeFBXUXtxQK98PMjI1Qv
         F8rw==
X-Gm-Message-State: AOJu0YybQnZakrZFTlEBN57TvSA1l+kxqL+duDzI3KRJC4b2G67BR1mY
	4nxFx94CSIE5CSSkqpqbmpiQPRdYOBKnsLPT9N4ZM7+RosgBu8vVpxGwSWT8IzEaGeraxgWxcYy
	1T8o3RS6Vw51sShkUvUxVFQ==
X-Received: by 2002:a7b:c853:0:b0:401:db82:3edf with SMTP id c19-20020a7bc853000000b00401db823edfmr9908947wml.39.1694503112135;
        Tue, 12 Sep 2023 00:18:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQr59YxQoahIdt2pGpOn3n/3cyfcIn7qrajZoDiICpNrmoOnS/ynh5Tia67CgdCYHJ/KD0yA==
X-Received: by 2002:a7b:c853:0:b0:401:db82:3edf with SMTP id c19-20020a7bc853000000b00401db823edfmr9908928wml.39.1694503111718;
        Tue, 12 Sep 2023 00:18:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74f:d600:c705:bc25:17b2:71c9? (p200300cbc74fd600c705bc2517b271c9.dip0.t-ipconnect.de. [2003:cb:c74f:d600:c705:bc25:17b2:71c9])
        by smtp.gmail.com with ESMTPSA id y9-20020a7bcd89000000b003fed630f560sm12028942wmj.36.2023.09.12.00.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 00:18:31 -0700 (PDT)
Message-ID: <7f4881dc-885a-a8f5-47a5-0dd23886a416@redhat.com>
Date: Tue, 12 Sep 2023 09:18:30 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 1/2] efi/unaccepted: Do not let /proc/vmcore try to
 access unaccepted memory
To: Adrian Hunter <adrian.hunter@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@linux.ibm.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 kexec@lists.infradead.org
References: <20230911112114.91323-1-adrian.hunter@intel.com>
 <20230911112114.91323-2-adrian.hunter@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230911112114.91323-2-adrian.hunter@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.09.23 13:21, Adrian Hunter wrote:
> Support for unaccepted memory was added recently, refer commit dcdfdd40fa82
> ("mm: Add support for unaccepted memory"), whereby a virtual machine may
> need to accept memory before it can be used.
> 
> Do not let /proc/vmcore try to access unaccepted memory because it can
> cause the guest to fail.
> 
> For /proc/vmcore, which is read-only, this means a read or mmap of
> unaccepted memory will return zeros.
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

[...]

> +static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
> +{
> +	phys_addr_t paddr = pfn << PAGE_SHIFT;
> +
> +	return range_contains_unaccepted_memory(paddr, paddr + PAGE_SIZE);
> +}
> +
>   #endif /* _LINUX_MM_H */

As stated, if the relevant table is not already properly populated with 
information about unaccepted memory by the first kernel, this probably 
logically belongs into Kirills series.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

