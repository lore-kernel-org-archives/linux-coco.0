Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F92DF51E
	for <linux-coco@lists.linux.dev>; Mon, 11 Sep 2023 14:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694442835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6fgHbS8D+uTD08GSlTthpp2bLqas6LD5jQg3oM+vXs=;
	b=SpGLeqqqjkHrMmhVdYWyncPz28hhfDKqBgeXC6iMk6H4hgbJQgIdXGxTCOD5ePn9uou/XS
	16L6ULekstJfN1soR5+jpyZzYx2qCAclxJks9Qm+X4mJMzQjHt3T6WfOgecJRP7LQkd6uG
	Xwyu+xB/ZEVyXDjMAH1aJQHRVdtUT0Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-eqHV-WdwODqeO7dpcLtxTg-1; Mon, 11 Sep 2023 10:33:52 -0400
X-MC-Unique: eqHV-WdwODqeO7dpcLtxTg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-401d8873904so36428645e9.0
        for <linux-coco@lists.linux.dev>; Mon, 11 Sep 2023 07:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694442831; x=1695047631;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6fgHbS8D+uTD08GSlTthpp2bLqas6LD5jQg3oM+vXs=;
        b=FEJcdd44zP2YzJd2wVu8inyLrfs5WYK62aNhkQZry5c8YXbKaYApFzem26lOtkMCmX
         /lEQkwJFrlb3HTXQPXY/BRlOlkxf70lqjMTdWGD64IWkGVYrdE+ti7Mn8hcSxYlr8Dw8
         DKGlr35fCvZXRDUPGcKvPWl3+eQ+L+lkU5lu1keIH1yTRsi1yeC1ehv2lf5qT1HO0927
         5GtrioGKAzHxGZJ0LgQ+3EQKr+7M7EfA8DlDjkQPtG+kc+ZhtqvqK98WnrwVcgqb5wzW
         t+1huv1/OWBMBrIKsV7hNz1fuzDx2fFsxpjeuPmuNjAK9sy8VMSdETqIQEhoji7vg/Ey
         GlCw==
X-Gm-Message-State: AOJu0Yzz1xGmn1ajgZn5zXYAOQzjBao6Z6uwGG9jCYgUO1zwR9qFBpp5
	gkIT22w4ceC4vmvVzLzPj5mVZL1fzNxTd3HsZAoQgvwQzT+boIMaHkABO4BHhzQbVj0q2QbkKYg
	y/dpgysFK6CF3eVqtXlFLBw==
X-Received: by 2002:a05:600c:5120:b0:402:f517:9c07 with SMTP id o32-20020a05600c512000b00402f5179c07mr7985429wms.0.1694442831134;
        Mon, 11 Sep 2023 07:33:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5pMvmXX0+VW9KHCfmQiDyHsdxBecmD9teUi0kfSkwDsZ1VNAU+o/EeDi3ry3+F0HnO2KLxQ==
X-Received: by 2002:a05:600c:5120:b0:402:f517:9c07 with SMTP id o32-20020a05600c512000b00402f5179c07mr7985407wms.0.1694442830722;
        Mon, 11 Sep 2023 07:33:50 -0700 (PDT)
Received: from ?IPV6:2003:cb:c743:5500:a9bd:94ab:74e9:782f? (p200300cbc7435500a9bd94ab74e9782f.dip0.t-ipconnect.de. [2003:cb:c743:5500:a9bd:94ab:74e9:782f])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d634d000000b0031c5e9c2ed7sm10238812wrw.92.2023.09.11.07.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 07:33:50 -0700 (PDT)
Message-ID: <f05056e6-77a7-d0f5-615e-36efaab3ff05@redhat.com>
Date: Mon, 11 Sep 2023 16:33:48 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] proc/vmcore: Do not map unaccepted memory
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@linux.ibm.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 kexec@lists.infradead.org
References: <20230906073902.4229-1-adrian.hunter@intel.com>
 <20230906073902.4229-2-adrian.hunter@intel.com>
 <ef97f466-b27a-a883-7131-c2051480dd87@redhat.com>
 <20230911084148.l6han7jxob42rdvm@box.shutemov.name>
 <49ab74c8-553b-b3d0-6a72-2d259a2b5bdf@redhat.com>
 <20230911092712.2ps55mylf7elfqp6@box.shutemov.name>
 <476456e1-ac50-8e48-260d-5cbe5e8b085e@redhat.com>
 <20230911100555.mjjnx3ujnjlaxgsy@box.shutemov.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230911100555.mjjnx3ujnjlaxgsy@box.shutemov.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.09.23 12:05, Kirill A. Shutemov wrote:
> On Mon, Sep 11, 2023 at 11:50:31AM +0200, David Hildenbrand wrote:
>> On 11.09.23 11:27, Kirill A. Shutemov wrote:
>>> On Mon, Sep 11, 2023 at 10:42:51AM +0200, David Hildenbrand wrote:
>>>> On 11.09.23 10:41, Kirill A. Shutemov wrote:
>>>>> On Mon, Sep 11, 2023 at 10:03:36AM +0200, David Hildenbrand wrote:
>>>>>> On 06.09.23 09:39, Adrian Hunter wrote:
>>>>>>> Support for unaccepted memory was added recently, refer commit
>>>>>>> dcdfdd40fa82 ("mm: Add support for unaccepted memory"), whereby
>>>>>>> a virtual machine may need to accept memory before it can be used.
>>>>>>>
>>>>>>> Do not map unaccepted memory because it can cause the guest to fail.
>>>>>>>
>>>>>>> For /proc/vmcore, which is read-only, this means a read or mmap of
>>>>>>> unaccepted memory will return zeros.
>>>>>>
>>>>>> Does a second (kdump) kernel that exposes /proc/vmcore reliably get access
>>>>>> to the information whether memory of the first kernel is unaccepted (IOW,
>>>>>> not its memory, but the memory of the first kernel it is supposed to expose
>>>>>> via /proc/vmcore)?
>>>>>
>>>>> There are few patches in my queue to few related issue, but generally,
>>>>> yes, the information is available to the target kernel via EFI
>>>>> configuration table.
>>>>
>>>> I assume that table provided by the first kernel, and not read directly from
>>>> HW, correct?
>>>
>>> The table is constructed by the EFI stub in the first kernel based on EFI
>>> memory map.
>>>
>>
>> Okay, should work then once that's done by the first kernel.
>>
>> Maybe include this patch in your series?
> 
> Can do. But the other two patches are not related to kexec. Hm.

Yes, the others can go in separately. But this here really needs other 
kexec/kdump changes.

-- 
Cheers,

David / dhildenb

