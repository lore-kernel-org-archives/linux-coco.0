Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5467E
	for <linux-coco@lists.linux.dev>; Wed,  1 Jun 2022 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654074028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=47e42rnIYaU6sJqvrI7HnnRd2dfzcghd2QGgfknq5Gw=;
	b=B4GOV2DVy+ciGbiEMpmzQvXARh+SkwiEXKF6Ydh8qPq0k0f7/ecGcFzI7uzS4fEItMxP++
	nF59PnZ2sJsXxDaeUzde4iHE0df2W1Zt9gLMsC9bCdJ3oQ35UkrTZ7ANRx/SQCSML2jtRG
	rkMXdhlcF0zVYqx/1TXhmDljKdxrDH8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-J7HtnU7OOnOqvUZIkO_KmA-1; Wed, 01 Jun 2022 05:00:26 -0400
X-MC-Unique: J7HtnU7OOnOqvUZIkO_KmA-1
Received: by mail-wm1-f70.google.com with SMTP id j14-20020a05600c1c0e00b003973bf0d146so812948wms.4
        for <linux-coco@lists.linux.dev>; Wed, 01 Jun 2022 02:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=47e42rnIYaU6sJqvrI7HnnRd2dfzcghd2QGgfknq5Gw=;
        b=UyBGVh4r992MEJTuXRcVC/BQuDPn7UtmvPusRrhEVQQFh5fSkzC3ab8rb8SyLBrEgk
         7VzGtEDbevzjM/zpboKyJOHIt0fTClUUunHLmnHWRAFLk7aIABqHCVWc3gp3ijaYuP3A
         OJMPuIgTd+bku5sI9Qps9YiH/nGsIQrMdu0ujS/crRT+TdbmrO+VBmIWLdxZR7tYVguz
         8Jnqcmic7+2ayI0/grrLAdVRU2c8FauDoqITynw99Qd6PUyC9cnInVz0jyWTHg6ttIr7
         xQ3qmx5a4j8jDALB4pF2XCHJxtCcs3/SZ+OZwlvySEL4YfpTzxynYMhPX3aoL4jSPUtm
         VPvw==
X-Gm-Message-State: AOAM532jlC3KwNiDmaGiO9HD9+RTKqcd8GZWGRyskOi5KILzePxoZ+XQ
	LeJhNuQJ6bkXjDd7rgBHW1DigVE/qiet+QX5wKWbCkoA3dctCNTb+h9Y8B1rSBuObLm0++XZ3Hb
	XIDYriuqZo/LvWkoB9OSPHA==
X-Received: by 2002:a5d:6d0a:0:b0:20f:ecc9:2819 with SMTP id e10-20020a5d6d0a000000b0020fecc92819mr34366330wrq.666.1654074025594;
        Wed, 01 Jun 2022 02:00:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJFJMguj1HytJIpfb+YPwV4xImpt7pcmIEp7Y330tAofv7dZyg6rYBGjWbJBVTyfbKbEYsog==
X-Received: by 2002:a5d:6d0a:0:b0:20f:ecc9:2819 with SMTP id e10-20020a5d6d0a000000b0020fecc92819mr34366292wrq.666.1654074025277;
        Wed, 01 Jun 2022 02:00:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2600:951d:63df:c091:3b45? (p200300cbc7052600951d63dfc0913b45.dip0.t-ipconnect.de. [2003:cb:c705:2600:951d:63df:c091:3b45])
        by smtp.gmail.com with ESMTPSA id h1-20020a056000000100b0020c5253d8casm992951wrx.22.2022.06.01.02.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 02:00:24 -0700 (PDT)
Message-ID: <b9a0eb0a-ce27-5306-a12f-79d196445254@redhat.com>
Date: Wed, 1 Jun 2022 11:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Dave Hansen <dave.hansen@intel.com>, Mike Rapoport <rppt@kernel.org>,
 marcelo.cerri@canonical.com, tim.gardner@canonical.com,
 khalid.elmously@canonical.com, philip.cox@canonical.com, x86@kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
 <20220517153444.11195-4-kirill.shutemov@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCHv6 03/15] efi/x86: Get full memory map in allocate_e820()
In-Reply-To: <20220517153444.11195-4-kirill.shutemov@linux.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.22 17:34, Kirill A. Shutemov wrote:
> Currently allocate_e820() only interested in the size of map and size of
> memory descriptor to determine how many e820 entries the kernel needs.
> 
> UEFI Specification version 2.9 introduces a new memory type --
> unaccepted memory. To track unaccepted memory kernel needs to allocate
> a bitmap. The size of the bitmap is dependent on the maximum physical
> address present in the system. A full memory map is required to find
> the maximum address.
> 
> Modify allocate_e820() to get a full memory map.

Usually we use max_pfn, if we want to know the maximum pfn that's
present in the system (well, IIRC, excluding hotunplug).

How exactly will this (different?) maximum from UEFI for the bitmap
interact with

max_pfn = e820__end_of_ram_pfn();

from e820 in existing code

?

-- 
Thanks,

David / dhildenb

