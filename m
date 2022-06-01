Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6907C2562
	for <linux-coco@lists.linux.dev>; Wed,  1 Jun 2022 14:44:57 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id z13so2231961ljn.11
        for <linux-coco@lists.linux.dev>; Wed, 01 Jun 2022 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LvrIFqHHGXUVgoifCY/oFu21MGkFJUkJFZqNI+NbYR8=;
        b=yUdMxLaD0W66OdCYioHhoD9gW6M1g+oPiTwhz8QjBPsmhZRk+xpyKrrZYMwaBI5XQw
         jZF29wuwBsRx9N/Ef1/0c3+T4sWHE9lfvTYgEsiMHIG8hfjDoNd7eBMVEOq+EIbYfQuq
         9lroUnnbox8DbJ4OUbkF5AFRgPeJFaJ1g5LJcEaThvWz1dkS1fHiHSeV4xE5gOEIuLHP
         WlEqu0rJ8yR1wISJEvp2oCUG3dcfqARrIGtk4Mh6RoKRDLOnG4pjqMoIAoBV5xrkNfba
         ZHu59dGJs7depH3ibMoOoWZRMc0pm9M3SMCETLJJIkFFmHwmz8JyPj1ES6NBP8fjhql2
         x2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LvrIFqHHGXUVgoifCY/oFu21MGkFJUkJFZqNI+NbYR8=;
        b=x1y31yH8ZBGE00aW9KuDKuY3bpS/7oQ1ifJeNf9GPlR0dSrKz07qw55oyTGc/ei2rM
         afF2+uHQw32eNW0MT+lEumIsL/fOPe7dkWaZgAwqU1ui+F7ryaWJ2Qpd7HUFdpcbNKtm
         h9t82lNjw0fZNj88ssko6GUX0y1v8Rh7ODuDtrU9LzdVMEbObxky6TolYfazkST59w/3
         g2TEhf8xU/LjsAhZUlFRQ7/h21MbjNk6pi6yJBn1jcbIjHOiUaBgzng5VuK3t/+ETFhW
         UzP1EUl0JSpqEyW7t8nQlC3YJDcczM8fjYvzDgA5kgDx3Pr0WJZWAe+3c1vjXIV801Je
         1h+A==
X-Gm-Message-State: AOAM531qSqv13Vs1wBp6X5W7sEjDkzimgcIGWFw9eWYBiTv5fok8tLhG
	h+lAp/9Qsz0hwAkP0vw+l88IHg==
X-Google-Smtp-Source: ABdhPJzwTyr7jGZX5uox6FLAvsLwDvePrH2SadM33Ry+s6biX0Ay2qFGDYwW40N2obLPeLIf7Sxg4Q==
X-Received: by 2002:a2e:a176:0:b0:253:dbf1:b023 with SMTP id u22-20020a2ea176000000b00253dbf1b023mr36240386ljl.421.1654094695470;
        Wed, 01 Jun 2022 07:44:55 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id h10-20020ac250ca000000b0047255d2119fsm397178lfm.206.2022.06.01.07.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 07:44:55 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id E21D6109789; Wed,  1 Jun 2022 17:46:54 +0300 (+03)
Date: Wed, 1 Jun 2022 17:46:54 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: David Hildenbrand <david@redhat.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Mike Rapoport <rppt@kernel.org>, marcelo.cerri@canonical.com,
	tim.gardner@canonical.com, khalid.elmously@canonical.com,
	philip.cox@canonical.com, x86@kernel.org, linux-mm@kvack.org,
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv6 03/15] efi/x86: Get full memory map in allocate_e820()
Message-ID: <20220601144654.jtp6t2c6u4su4gwd@box.shutemov.name>
References: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
 <20220517153444.11195-4-kirill.shutemov@linux.intel.com>
 <b9a0eb0a-ce27-5306-a12f-79d196445254@redhat.com>
 <20220601143515.iavmtysdchirbtel@box.shutemov.name>
 <116f7be4-7b75-a83b-899b-c23b52534b30@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <116f7be4-7b75-a83b-899b-c23b52534b30@redhat.com>

On Wed, Jun 01, 2022 at 04:39:16PM +0200, David Hildenbrand wrote:
> On 01.06.22 16:35, Kirill A. Shutemov wrote:
> > On Wed, Jun 01, 2022 at 11:00:23AM +0200, David Hildenbrand wrote:
> >> On 17.05.22 17:34, Kirill A. Shutemov wrote:
> >>> Currently allocate_e820() only interested in the size of map and size of
> >>> memory descriptor to determine how many e820 entries the kernel needs.
> >>>
> >>> UEFI Specification version 2.9 introduces a new memory type --
> >>> unaccepted memory. To track unaccepted memory kernel needs to allocate
> >>> a bitmap. The size of the bitmap is dependent on the maximum physical
> >>> address present in the system. A full memory map is required to find
> >>> the maximum address.
> >>>
> >>> Modify allocate_e820() to get a full memory map.
> >>
> >> Usually we use max_pfn, if we want to know the maximum pfn that's
> >> present in the system (well, IIRC, excluding hotunplug).
> >>
> >> How exactly will this (different?) maximum from UEFI for the bitmap
> >> interact with
> >>
> >> max_pfn = e820__end_of_ram_pfn();
> >>
> >> from e820 in existing code
> >>
> >> ?
> > 
> > I'm not sure I understand the question.
> 
> Essentially, if the PFN you calculate here for the bitmap size will
> essentially match later max_pfn.

Yes, generally. But is can decrease if kernel transit memory from TYPE_RAM
to TYPE_RESERVE. In any case we will not step out of the allocated bitmap.

-- 
 Kirill A. Shutemov
