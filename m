Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AF3171DA
	for <linux-coco@lists.linux.dev>; Tue, 12 Sep 2023 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694503182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcEya9HqsW3o+5ldQKv7HTPg9J+Z7fGPS0QxHHzAjY0=;
	b=EInQwufjK6X2hqSzpyD8lfb5B2tmW/zoFx+AlU0aAHMZEvvGmd1QCfuwH588gEdIqojYi9
	BaSbNH/5nNf02s5wkBEpdPlmUrVQzEqFDBjuy4glPqUTmj8JGN/mYDlVlovLni7m35fQiI
	6cRWXcnqWmbYsOOgySLJjDvPjX7+A+Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-9F_j5WoOPZWo8J57es--9g-1; Tue, 12 Sep 2023 03:19:41 -0400
X-MC-Unique: 9F_j5WoOPZWo8J57es--9g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-402cba95486so41753275e9.0
        for <linux-coco@lists.linux.dev>; Tue, 12 Sep 2023 00:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503180; x=1695107980;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcEya9HqsW3o+5ldQKv7HTPg9J+Z7fGPS0QxHHzAjY0=;
        b=mz3yxpQZvoB8x31b1KQ4kzHzNKwjqytcWhmtoDG2Q8hdRjAK+emr95IsSgCb/urJdk
         Hsv8h9axXti9f7NTKPUfnuor1GSIOLBT+2PqXK2tfVqwdZ8qMzu9XP56498Qf9JJCc9p
         XNJk71MwsITZ5uc3mRm9uuCJm9ir7FwybPsiYeAPmRG0DGnQTMKoxtDmUJCHFKqHje4a
         I+mJb4f7MAJo9+3iP7Kfqwvj+3JH8BZBl7BL3qlYNQItkWZ22hOB8dmLAppd9Mo0N4GM
         I1l+PUoqveSIzSzSvlwLSKk8yYkh0Q3kkbcnkF5p8SLBL04dHJYTABhMicBdiO3TxDXA
         keag==
X-Gm-Message-State: AOJu0YxcQsDgqcMVE6mlLrseRg5A3I8IaFbBuc5JDcTZGPR+nYDLlKWg
	9UkVOVSYxjkz8qz43Dl0eSCd5z+cQrgaqPayakZnPtUP6L/eeysofwuYJMyPLAio4uT+mWYVuAD
	37FWRDyKDw6gqxFtWC96SYg==
X-Received: by 2002:a1c:7c0e:0:b0:401:6800:703c with SMTP id x14-20020a1c7c0e000000b004016800703cmr11272014wmc.21.1694503180596;
        Tue, 12 Sep 2023 00:19:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBHMbRtiRZlVheP6qVSb8MqZ6oMl+4dwmRZR30fLEhp0pib6sKRWhTtFCZOTZU2I6KyZfYPg==
X-Received: by 2002:a1c:7c0e:0:b0:401:6800:703c with SMTP id x14-20020a1c7c0e000000b004016800703cmr11271987wmc.21.1694503180236;
        Tue, 12 Sep 2023 00:19:40 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74f:d600:c705:bc25:17b2:71c9? (p200300cbc74fd600c705bc2517b271c9.dip0.t-ipconnect.de. [2003:cb:c74f:d600:c705:bc25:17b2:71c9])
        by smtp.gmail.com with ESMTPSA id g17-20020a7bc4d1000000b003fc02e8ea68sm15188204wmk.13.2023.09.12.00.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 00:19:39 -0700 (PDT)
Message-ID: <96f124d6-c1f2-adb3-1d3b-8329e85ff099@redhat.com>
Date: Tue, 12 Sep 2023 09:19:38 +0200
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

Oh, hold on. What are the actual side effects of this?

Once we're in the kdump kernel, any guest is already dead. So failing a 
guest doesn't apply, no?

-- 
Cheers,

David / dhildenb

