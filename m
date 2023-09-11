Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C1A320A
	for <linux-coco@lists.linux.dev>; Mon, 11 Sep 2023 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694421776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1O9Hjy9rHsZrvC8iggQtpHWHNRqlOhd3zFoat4Zny8=;
	b=SXcwhLXnJLi+LlIp2MIOs54nBcimFhDhLMr3Q9Du7F5CyrOVhkr2pGxT2wPVmpvss6vmLD
	ziT4tYhhk86OLUGmWB3dZZ2gIUj6lIeb9pEjyQH/aVNIv7vq63spYeXtzqsmcOUZmuSslO
	uQQgAixZPG+8FKyPa3cMJgwII3BiKwo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-msLnRqCzO_WUW9eS5loiZw-1; Mon, 11 Sep 2023 04:42:54 -0400
X-MC-Unique: msLnRqCzO_WUW9eS5loiZw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fd0fa4d08cso31441395e9.1
        for <linux-coco@lists.linux.dev>; Mon, 11 Sep 2023 01:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694421773; x=1695026573;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1O9Hjy9rHsZrvC8iggQtpHWHNRqlOhd3zFoat4Zny8=;
        b=q5A3Wd66XgXxBGsqrrySDFQCaekD5boazNvWlml468kNivdvC4u/hskjzqg0FDNLW1
         E7ndp7hqYQpJ75+TaZeWKIMY75evc2p4BCzCshZGDV6z5oc4/lvIOZlxqakAfIrQf3I3
         fci+SoPMbi8bT0P81mG1LnaUWRDerGWCJxWjeeXZrK7TnKBcLsKnSxx/ldqcPyDdwlYu
         0SBkH16AKkGcA0OcmrtWQ/lFt4WylkooeWKa4H01eEofwh+vBdARQf5bLYiyCTZ1eb/x
         YBfrGcmP/QiEbsDijYsS4nCWBanw5RR7qgMv9E9nxefsPfyNUGp6Vumvom1ISyO8cWXC
         4G4g==
X-Gm-Message-State: AOJu0YyULGD7L7dqKerWbpp0TNkyMqHb1oR5a1PN2WvrDhxa92T6hbSf
	0NE0zUt1MZPYYqiBKCzj0wE2y9MY1Bs16HGtc/rNTqfw7wiVuNFfc2/n0F2m6hZjO8xQV4ShxdJ
	yoUS75CCXXi53QULx23KapA==
X-Received: by 2002:a1c:ed0b:0:b0:3fc:21:2c43 with SMTP id l11-20020a1ced0b000000b003fc00212c43mr7346854wmh.13.1694421773455;
        Mon, 11 Sep 2023 01:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8aoBWfTO9D3ZTCmaaRT0GwaH8BSrY/roXA5t7CzHxEaXPavXU1Y6T8UuPI7Q1KEVVmKAG3w==
X-Received: by 2002:a1c:ed0b:0:b0:3fc:21:2c43 with SMTP id l11-20020a1ced0b000000b003fc00212c43mr7346817wmh.13.1694421772969;
        Mon, 11 Sep 2023 01:42:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c743:5500:a9bd:94ab:74e9:782f? (p200300cbc7435500a9bd94ab74e9782f.dip0.t-ipconnect.de. [2003:cb:c743:5500:a9bd:94ab:74e9:782f])
        by smtp.gmail.com with ESMTPSA id g12-20020a7bc4cc000000b003fee849df23sm9372755wmk.22.2023.09.11.01.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 01:42:52 -0700 (PDT)
Message-ID: <49ab74c8-553b-b3d0-6a72-2d259a2b5bdf@redhat.com>
Date: Mon, 11 Sep 2023 10:42:51 +0200
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230911084148.l6han7jxob42rdvm@box.shutemov.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.09.23 10:41, Kirill A. Shutemov wrote:
> On Mon, Sep 11, 2023 at 10:03:36AM +0200, David Hildenbrand wrote:
>> On 06.09.23 09:39, Adrian Hunter wrote:
>>> Support for unaccepted memory was added recently, refer commit
>>> dcdfdd40fa82 ("mm: Add support for unaccepted memory"), whereby
>>> a virtual machine may need to accept memory before it can be used.
>>>
>>> Do not map unaccepted memory because it can cause the guest to fail.
>>>
>>> For /proc/vmcore, which is read-only, this means a read or mmap of
>>> unaccepted memory will return zeros.
>>
>> Does a second (kdump) kernel that exposes /proc/vmcore reliably get access
>> to the information whether memory of the first kernel is unaccepted (IOW,
>> not its memory, but the memory of the first kernel it is supposed to expose
>> via /proc/vmcore)?
> 
> There are few patches in my queue to few related issue, but generally,
> yes, the information is available to the target kernel via EFI
> configuration table.

I assume that table provided by the first kernel, and not read directly 
from HW, correct?

-- 
Cheers,

David / dhildenb

