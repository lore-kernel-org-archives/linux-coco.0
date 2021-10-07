Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B962C81
	for <linux-coco@lists.linux.dev>; Thu,  7 Oct 2021 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633623479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=blEAPOI+nF0owA6gNBYFWO1A41DzHlnw6VWPwMJ/+zM=;
	b=Y9zVBL7vTMGRWFRzNfprRpivPIZY+gaKkDtu563JI/xRaRo1A5C+UfOCOFYa9/DBWRtYZZ
	el703Nd7vDBAHyN5YqqeibP+sG4be8npCtvMP4M6yXO44YnCpjjQyVDfVX/a6oBOExggGe
	s/WqMRnfUPagzbED9oQHbzwt1XZP2tU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-8R_8IALuO5CtxmWOV8eCYQ-1; Thu, 07 Oct 2021 12:17:58 -0400
X-MC-Unique: 8R_8IALuO5CtxmWOV8eCYQ-1
Received: by mail-wr1-f69.google.com with SMTP id l9-20020adfc789000000b00160111fd4e8so5141939wrg.17
        for <linux-coco@lists.linux.dev>; Thu, 07 Oct 2021 09:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=blEAPOI+nF0owA6gNBYFWO1A41DzHlnw6VWPwMJ/+zM=;
        b=WiPkIJ39Wf54GCxAH9z6fWyZSbYt3aK0fK4p7K4EAIiJL9HjM6ghJGDFBhcCMihsQn
         fwSS9GzIglI/wJIWYDiCX75LxXbGoTMKTVLL7okLgyNITcxHHdYwvXwSoLFcPk2XrS5p
         B2RIXNXD/1z49jOiIfPOs9qb1UHAsFT9JwaZhCGSYSZVDixXCv2XfEb1vccDbH6bso4S
         Xyk2X7Ne1ZPcuLi6wRAr7iAl8jhyWbMH0bLHTwDetEMUxNU0ig5cq4mV4v8nbE0PAXyq
         C/3DpFd1FMzZcgEebDjc41I/96L+hCOyIOKMqU175hZDLxaOXFAG5I2gns+JvZlmtMW2
         BJrg==
X-Gm-Message-State: AOAM5336uExg1vtUlfIBMg5BYvlszE3uYSiZlQaKSNpN0/Kb+mwDHDad
	GXJEb7rM8XhZ+YcLsovM1pxQzyH2q2wvKth+AOwUcQ1saoziforcRPwLWlSRcaFqT95kIwy4Z9z
	Vx8rITdk5VIyqE0yLeCPwxA==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr6853079wrr.278.1633623477620;
        Thu, 07 Oct 2021 09:17:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrADigG00ZrKN1jM1AZoSZzR3uxS9vfFO2wr7+DM1JoV/qmvfoFSceMTUWkIHap1R4hsOMQg==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr6853057wrr.278.1633623477478;
        Thu, 07 Oct 2021 09:17:57 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id k17sm9320224wmj.0.2021.10.07.09.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 09:17:56 -0700 (PDT)
Date: Thu, 7 Oct 2021 17:17:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, linux-efi@vger.kernel.org,
	Borislav Petkov <bp@suse.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Andi Kleen <ak@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Andrew Scull <ascull@google.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
	Jim Cadden <jcadden@ibm.com>,
	Daniele Buono <dbuono@linux.vnet.ibm.com>,
	linux-coco@lists.linux.dev, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] virt: Add sev_secret module to expose
 confidential computing secrets
Message-ID: <YV8dsl+qgbIH6z8F@work-vm>
References: <20211007061838.1381129-1-dovmurik@linux.ibm.com>
 <20211007061838.1381129-5-dovmurik@linux.ibm.com>
 <7e2a4595-3f9c-6d65-34e3-af7c1d6da196@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7e2a4595-3f9c-6d65-34e3-af7c1d6da196@intel.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Dave Hansen (dave.hansen@intel.com) wrote:
> On 10/6/21 11:18 PM, Dov Murik wrote:
> > +static int sev_secret_map_area(void)
> > +{
> > +	struct sev_secret *s = sev_secret_get();
> > +	struct linux_efi_coco_secret_area *secret_area;
> > +	u32 secret_area_size;
> > +
> > +	if (efi.coco_secret == EFI_INVALID_TABLE_ADDR) {
> > +		pr_err("Secret area address is not available\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	secret_area = memremap(efi.coco_secret, sizeof(*secret_area), MEMREMAP_WB);
> > +	if (secret_area == NULL) {
> > +		pr_err("Could not map secret area header\n");
> > +		return -ENOMEM;
> > +	}
> 
> There doesn't seem to be anything truly SEV-specific in here at all.
> Isn't this more accurately called "efi_secret" or something?  What's to
> prevent Intel or an ARM vendor from implementing this?

I don't think anything; although the last discussion I remember on list
with Intel was that Intel preferred some interface with an ioctl to read
the secrets and stuff.  I'm not quite sure if the attestation/secret
delivery order makes sense with TDX, but if it does, then if you could
persuade someone to standardise on this it would be great.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

