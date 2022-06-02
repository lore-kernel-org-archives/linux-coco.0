Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70CD620
	for <linux-coco@lists.linux.dev>; Thu,  2 Jun 2022 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654159205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9X9eKlzEclLa6MvLNYAdFd2zQQAwQquxfSZzdJAnY0=;
	b=Ug3+T1L60VN7h0qXir2+cUV8RnO226cGTP938EOsU6aPoIS5UuThpZxq84m2IvZQWvKd3d
	Szf1s95Sd6wHaYdujjt5bESC33VHGFDjf5Qqy8yFQxAyqM7fDxViVc3R+ryl00JqxYmKR9
	eO1IbygqSGE2WmUriaffy6+YurZqBEk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-DiuZXvGIO066ZBkJ8a9j5Q-1; Thu, 02 Jun 2022 04:40:04 -0400
X-MC-Unique: DiuZXvGIO066ZBkJ8a9j5Q-1
Received: by mail-wm1-f71.google.com with SMTP id o3-20020a05600c4fc300b003946a9764baso4815534wmq.1
        for <linux-coco@lists.linux.dev>; Thu, 02 Jun 2022 01:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=J9X9eKlzEclLa6MvLNYAdFd2zQQAwQquxfSZzdJAnY0=;
        b=L5LiFdlQeqW4IpEvIQISnjRAVD3qSBOcyyxmKyCrqyCEPZaxq3a1zICVYLeVZu2IL5
         3xuBkd9XgjG66dRyR5MnxRSFIOx1uSDo1q/7a6E5qQwZuc6uro92X9FpWP0Cx0T+c3jt
         16+z0RwZ9N7TOxxRwQ+PjScwP9Q9qk7/PxwQc7uJEyr4ubXn6hng28NsCQ7XZRiHdv4w
         6mUoXOM5NEBXqIj2R6vh5G3yuDKOBEVUw/4HHjhVSGx8B+5wpEe0aL4cTUjgFqiqHTze
         Xdnn60WkH2mE/fqXzMT0SjYZQu/YbwSzPpb5O1xsFRVSQ4yOopSqTtwKLcfOQL+shNWT
         5ZwA==
X-Gm-Message-State: AOAM530YbmtcLsfOfT/EFHIXxpRGXWcfIi0fvkQ0BjbjVqSHprvn1+nT
	veIluEaTFwjAPjiEDW2IiVN5QEm3zpfwwAdtUk7kks3EvwP4EBQJoBhxQjB6PYpQmGEwkS4QLnC
	UgQ03fIAIBWhoMLv/f+EZug==
X-Received: by 2002:adf:f6d2:0:b0:211:f0bf:3d14 with SMTP id y18-20020adff6d2000000b00211f0bf3d14mr2763540wrp.264.1654159203391;
        Thu, 02 Jun 2022 01:40:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfIfFeYpd+hweqJ+/V1YU5ayupuojpWaT3H2UqQkV92iVE0trL+kBR715ZoiwRRgjTHCszLw==
X-Received: by 2002:adf:f6d2:0:b0:211:f0bf:3d14 with SMTP id y18-20020adff6d2000000b00211f0bf3d14mr2763500wrp.264.1654159203090;
        Thu, 02 Jun 2022 01:40:03 -0700 (PDT)
Received: from [192.168.178.20] (p57a1a7d6.dip0.t-ipconnect.de. [87.161.167.214])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d5045000000b0020d07d90b71sm3675589wrt.66.2022.06.02.01.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 01:40:02 -0700 (PDT)
Message-ID: <a678504c-3468-12e5-b51d-5670bdf165e5@redhat.com>
Date: Thu, 2 Jun 2022 10:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCHv6 10/15] x86/mm: Report unaccepted memory in /proc/meminfo
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
 <20220517153444.11195-11-kirill.shutemov@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220517153444.11195-11-kirill.shutemov@linux.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.22 17:34, Kirill A. Shutemov wrote:
> Track amount of unaccepted memory and report it in /proc/meminfo.

I feel like instead of doing this arch specific tracking here, we should
simply report the total number of unaccepted (base) pages in the buddy.

When the system boots up, the number will rise as unaccepted memory gets
exposed to the buddy. But especially once user space is up and running,
that number should only go down.

Once it hits zero, there is no unaccepted memory left in the buddy and
there won't be any performance surprises anymote -- and AFAIKT, that's
what we really care about.

-- 
Thanks,

David / dhildenb

