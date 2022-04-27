Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867737B
	for <linux-coco@lists.linux.dev>; Wed, 27 Apr 2022 23:47:14 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id j4so5744396lfh.8
        for <linux-coco@lists.linux.dev>; Wed, 27 Apr 2022 16:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d3JBH032OZXYtpGBAJOzi6uljYApdpfKzOYh6bko7eE=;
        b=Zg3c9TEeRcdmFxIUpyUxh/c2tfEr/aXAjm2pGWVZHwiw4P6Kmi/L06xaTKfuLgurXT
         qVPh8TPrmvVNdlaqB0UkF+w2Jy1JrwSLn2ljHkkxT3ESMZJY5sSd+jIu5IkRrcYOW/eD
         nPzQpVv+yCMe/1OaO+WUq+ojpx4C/Oo3Rhu2gSHHhuRCDVr0BzUmVW1moSFRctlK60q5
         4kjRArum4zfjukZQMKc9UfOW24hPl06V4NKl1B93D+vC4LkWqPrW30+IBByE30/J7AZi
         gyIiaiyRcJJmmThYd92r7ncjW4ygt8hJ5fMqypqpSiuzmRP/zYWrrD/0IlvkzP4AkSRX
         +F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d3JBH032OZXYtpGBAJOzi6uljYApdpfKzOYh6bko7eE=;
        b=zcqsljf5OPXphNwU9qFs5boSyZicmWq0igBbPmEVGTEsOONnVxpnCxRjz4SmK+B+3i
         G/+JBFQuwHrXV5rIhWmn7hm6kmsL0T9hEEH5fmAE6QrbSMYcTp+mW8F4l49zggNKoFzi
         fvwAmCZpIOgRvm3JY9oXR+j5Lhnobi0mgzgHx861wsCItV4GeUMdgORwhouNGn37BElo
         PnCXbt83j9EHvXc9zE0xyPCwp7kiHoAKeWFyVtM19gMP6y6zos6zgFMCddrrx8A3HJY8
         Ff7vENCREsXHqx/mZ32duuGoBl5ApfGnsQ6d6VkS+T/7YB8K8Ku6nmGtRDJjReZAgQks
         S/hw==
X-Gm-Message-State: AOAM532Sk46zR51Hts01N/z4PFBElTK/Fj2st3pMGUEf4XgXSfQwMOvO
	2tn7NtDkUMJIaql1lxheWDqqGw==
X-Google-Smtp-Source: ABdhPJyd7/6yh5iiIuj8rn3P0ozgbW9QsBWtwoT+5W/WRCywnd7rODQGiWIZNF2Y10nc1W1hO8atgw==
X-Received: by 2002:a05:6512:3f26:b0:46b:92c0:54da with SMTP id y38-20020a0565123f2600b0046b92c054damr23590201lfa.369.1651103232451;
        Wed, 27 Apr 2022 16:47:12 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id n7-20020a19ef07000000b004720eb4c309sm939338lfh.201.2022.04.27.16.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 16:47:11 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 74DEB103701; Thu, 28 Apr 2022 02:48:53 +0300 (+03)
Date: Thu, 28 Apr 2022 02:48:53 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Borislav Petkov <bp@alien8.de>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
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
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 03/12] efi/x86: Get full memory map in allocate_e820()
Message-ID: <20220427234853.6kt67gjrwzrhgvoa@box.shutemov.name>
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-4-kirill.shutemov@linux.intel.com>
 <YmmmpxVDyc3R5K2t@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmmmpxVDyc3R5K2t@zn.tnic>

On Wed, Apr 27, 2022 at 10:25:11PM +0200, Borislav Petkov wrote:
> On Mon, Apr 25, 2022 at 06:39:25AM +0300, Kirill A. Shutemov wrote:
> >  static efi_status_t allocate_e820(struct boot_params *params,
> > +				  struct efi_boot_memmap *map,
> >  				  struct setup_data **e820ext,
> >  				  u32 *e820ext_size)
> >  {
> > -	unsigned long map_size, desc_size, map_key;
> >  	efi_status_t status;
> > -	__u32 nr_desc, desc_version;
> > +	__u32 nr_desc;
> >  
> > -	/* Only need the size of the mem map and size of each mem descriptor */
> > -	map_size = 0;
> > -	status = efi_bs_call(get_memory_map, &map_size, NULL, &map_key,
> > -			     &desc_size, &desc_version);
> > -	if (status != EFI_BUFFER_TOO_SMALL)
> > -		return (status != EFI_SUCCESS) ? status : EFI_UNSUPPORTED;
> > -
> > -	nr_desc = map_size / desc_size + EFI_MMAP_NR_SLACK_SLOTS;
> > +	status = efi_get_memory_map(map);
> > +	if (status != EFI_SUCCESS)
> > +		return status;
> >  
> > -	if (nr_desc > ARRAY_SIZE(params->e820_table)) {
> > -		u32 nr_e820ext = nr_desc - ARRAY_SIZE(params->e820_table);
> > +	nr_desc = *map->map_size / *map->desc_size;
> > +	if (nr_desc > ARRAY_SIZE(params->e820_table) - EFI_MMAP_NR_SLACK_SLOTS) {
> > +		u32 nr_e820ext = nr_desc - ARRAY_SIZE(params->e820_table) +
> > +			EFI_MMAP_NR_SLACK_SLOTS;
> >  
> >  		status = alloc_e820ext(nr_e820ext, e820ext, e820ext_size);
> >  		if (status != EFI_SUCCESS)
> > -			return status;
> > +			goto out;
> 
> Still silly, that label is useless then. Pasting the whole, simplified
> function below.
> 
> It looks like it all boils down to propagating the retval up the chain...

Right. That's true. But having goto here makes patch 5/12 a bit cleaner.
I will move the goto there. Is that what you want to see?

-- 
 Kirill A. Shutemov
