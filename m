Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EE8C131
	for <linux-coco@lists.linux.dev>; Mon, 11 Sep 2023 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694425838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3hI7Q7HmJLGnvJ6TWSuqo/D2NRHYvfG0p6wZ2y0ko6s=;
	b=iNmAAAT8xpdp4DOUwWPF5X+CEscjgHLTva2MQF2ZyXsuRDOkFWYv/JTo3BoCpNuseUZ7Q8
	wiQ3wf5LJPkvCsPEk0JwsAtHpVDi6+rejn1ot6WmUkTcbcbOdF9V6zKdVpko7nt6DKWGBd
	xkGb4vu5W026UpkQy0a3sTqSvbrvm4Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-gkheSeuxOb6a1Zmq6sv6lA-1; Mon, 11 Sep 2023 05:50:34 -0400
X-MC-Unique: gkheSeuxOb6a1Zmq6sv6lA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40309efe8b1so8312805e9.2
        for <linux-coco@lists.linux.dev>; Mon, 11 Sep 2023 02:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425833; x=1695030633;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hI7Q7HmJLGnvJ6TWSuqo/D2NRHYvfG0p6wZ2y0ko6s=;
        b=V7Q15Zsdcj+RcZxLyNBiJPj7HeSSIF8r1yrtCqpfNQAHT279SGUlKZeIniMZR4Mwj6
         6r2GMPMQ3mbXp4rG083V8smTLfUAIiJmP8sC8b9oBU01LvWuDbPpkZreIbj7SdRmTI9a
         9DNnEV144Cyb969hJ4DTolL49fiodXTy7u/OktfdMOihXA636dwnm5XxULpyPVTAyK19
         AOuxdC6ATIB/qG3y9U56PzRWBgaRzK5OO77n4/2Eh0jhcjhsUMQkUA6jZcwuDJUeF7j7
         7BYSivG/fcgQBIsWi9r+2NUA/DagO9AlTzaKb/NVz0nDmU6kcnXHwrX2lUoUXCbKi9WB
         CQNw==
X-Gm-Message-State: AOJu0YyBEAq89UlJPd34L/COxVsTISU8cz+9dZbAfJrVUZaqGw/tr/60
	7OahFpfthV0FGg96ex4Uf2irtIBQIqHoUImJVB1rhOeKdkphwhKFM9lFOcsgo0qc5DIxry/pz7g
	TZ6ygRRL7THkUYlIkHTWreA==
X-Received: by 2002:a05:600c:ad2:b0:3fe:1871:1826 with SMTP id c18-20020a05600c0ad200b003fe18711826mr8233491wmr.27.1694425833709;
        Mon, 11 Sep 2023 02:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj8YJrIUf0UCqWXG8KH6oM4Y88u3/pmtlr2wHp0tLZ2zrPuhEBzJbkMb9F1qoq/xPMcrqORA==
X-Received: by 2002:a05:600c:ad2:b0:3fe:1871:1826 with SMTP id c18-20020a05600c0ad200b003fe18711826mr8233473wmr.27.1694425833313;
        Mon, 11 Sep 2023 02:50:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c743:5500:a9bd:94ab:74e9:782f? (p200300cbc7435500a9bd94ab74e9782f.dip0.t-ipconnect.de. [2003:cb:c743:5500:a9bd:94ab:74e9:782f])
        by smtp.gmail.com with ESMTPSA id n8-20020a7bcbc8000000b003fe29f6b61bsm9506299wmi.46.2023.09.11.02.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 02:50:32 -0700 (PDT)
Message-ID: <476456e1-ac50-8e48-260d-5cbe5e8b085e@redhat.com>
Date: Mon, 11 Sep 2023 11:50:31 +0200
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230911092712.2ps55mylf7elfqp6@box.shutemov.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.09.23 11:27, Kirill A. Shutemov wrote:
> On Mon, Sep 11, 2023 at 10:42:51AM +0200, David Hildenbrand wrote:
>> On 11.09.23 10:41, Kirill A. Shutemov wrote:
>>> On Mon, Sep 11, 2023 at 10:03:36AM +0200, David Hildenbrand wrote:
>>>> On 06.09.23 09:39, Adrian Hunter wrote:
>>>>> Support for unaccepted memory was added recently, refer commit
>>>>> dcdfdd40fa82 ("mm: Add support for unaccepted memory"), whereby
>>>>> a virtual machine may need to accept memory before it can be used.
>>>>>
>>>>> Do not map unaccepted memory because it can cause the guest to fail.
>>>>>
>>>>> For /proc/vmcore, which is read-only, this means a read or mmap of
>>>>> unaccepted memory will return zeros.
>>>>
>>>> Does a second (kdump) kernel that exposes /proc/vmcore reliably get access
>>>> to the information whether memory of the first kernel is unaccepted (IOW,
>>>> not its memory, but the memory of the first kernel it is supposed to expose
>>>> via /proc/vmcore)?
>>>
>>> There are few patches in my queue to few related issue, but generally,
>>> yes, the information is available to the target kernel via EFI
>>> configuration table.
>>
>> I assume that table provided by the first kernel, and not read directly from
>> HW, correct?
> 
> The table is constructed by the EFI stub in the first kernel based on EFI
> memory map.
> 

Okay, should work then once that's done by the first kernel.

Maybe include this patch in your series?

-- 
Cheers,

David / dhildenb

