Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA2A29CA
	for <linux-coco@lists.linux.dev>; Mon, 15 Nov 2021 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636993966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+1QitFYBWiDQVxeYMxt+2T1PiW/Z24o7Opt5Dq5eOk=;
	b=N/3K5m+G/67MLkB6Wra1Ho68dmeg4auWxCGV1CsHloHnoUQKrqJjsRYyuOvDBnsDJGPTIg
	JTblvJYaFoBkFje5BkipiQx9hrdZ/3yiGRk7fqQdhpnR15LXY+TLPBuYgR9WICTk2/OSuS
	lMxTtc0zBQttk7nrYcnJaSKUhdCiHnA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-luhmTVlAMR2opKbc-718SA-1; Mon, 15 Nov 2021 11:32:43 -0500
X-MC-Unique: luhmTVlAMR2opKbc-718SA-1
Received: by mail-wm1-f72.google.com with SMTP id j25-20020a05600c1c1900b00332372c252dso163898wms.1
        for <linux-coco@lists.linux.dev>; Mon, 15 Nov 2021 08:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=G+1QitFYBWiDQVxeYMxt+2T1PiW/Z24o7Opt5Dq5eOk=;
        b=gderZ0XAVmkA+pK84icLEFxmi7EgnaOKr5zNfuJQ2rBIBcUqhHmTlMuqU12MuvH8BN
         Betpg2h84nk7+EZEUruXisreavc9PLHNtB70CR9JiRX6qxSToU87epQSHWRX9ZMUq8Wy
         gTRdgkKt6Nz17qFdmWEFfcTM/0dDstx8m+ZO6IJCBV6Dg2nN/BipsEdDpPW2m1tqNX1Q
         CkU8q9VNO5Vvy+uHSjDS9/36KdYg85C0RWwM4AG2M+GkJpAkbfw5pM9ZBUBJA2tqQZ8d
         Hz6/KpmEkSFnxSgiua7pIPTaaMxRCl4ErdrzaNiVkMWgLDkr6sqwFGWlntZ/8ss9gbHE
         s3bw==
X-Gm-Message-State: AOAM5335cX/0jN0LBODV6JxOV1KsXY3s9lCyuM5ck8+OeCRiQwWqWA51
	+BI5jOFvlsdArA6sOPCKuutSjful6mKZNkqPD2rx5ErfC4IiCH0DZCKKl1Q/OY5yjMXd3PTFMQh
	KAnl8Xj5YkdHaB8ciL1Besw==
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr268318wrn.423.1636993962265;
        Mon, 15 Nov 2021 08:32:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1Ph4EnhC6A/4jYgelMQQLzwEg0cJbYa/8ZINUY3M4co7BZtJigqVuYd26TD4y155eMrBXqQ==
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr268261wrn.423.1636993962082;
        Mon, 15 Nov 2021 08:32:42 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id c79sm14527579wme.43.2021.11.15.08.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 08:32:41 -0800 (PST)
Date: Mon, 15 Nov 2021 16:32:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Joerg Roedel <jroedel@suse.de>
Cc: Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Peter Gonda <pgonda@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Tom Lendacky <Thomas.Lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH Part2 v5 00/45] Add AMD Secure Nested Paging (SEV-SNP)
 Hypervisor Support
Message-ID: <YZKLpiinvKcE896u@work-vm>
References: <20210820155918.7518-1-brijesh.singh@amd.com>
 <CAMkAt6o0ySn1=iLYsH0LCnNARrUbfaS0cvtxB__y_d+Q6DUzfA@mail.gmail.com>
 <061ccd49-3b9f-d603-bafd-61a067c3f6fa@intel.com>
 <YY6z5/0uGJmlMuM6@zn.tnic>
 <YY7FAW5ti7YMeejj@google.com>
 <YZJTA1NyLCmVtGtY@work-vm>
 <YZJx5PcBZ/izVg8L@suse.de>
 <YZJ9rzNOllCwvNEv@work-vm>
 <YZKI6lPIeniVSMjh@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YZKI6lPIeniVSMjh@suse.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Joerg Roedel (jroedel@suse.de) wrote:
> On Mon, Nov 15, 2021 at 03:33:03PM +0000, Dr. David Alan Gilbert wrote:
> > How would you debug an unexpected access by the host kernel using a
> > guests kdump?
> 
> The host needs to log the access in some way (trace-event, pr_err) with
> relevant information.

Yeh OK that makes sense if the host-owner could then enable some type of
debugging based on that event for the unfortunate guest owner.

> And with the guest-side kdump you can rule out that it was a guest bug
> which triggered the access. And you learn what the guest was trying to
> do when it triggered the access. This also helps finding the issue on
> the host side (if it is a host-side issue).
> 
> (Guest and host owner need to work together for debugging, of course).

Yeh.

Dave

> Regards,
> 
> -- 
> Jörg Rödel
> jroedel@suse.de
> 
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5
> 90409 Nürnberg
> Germany
>  
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

