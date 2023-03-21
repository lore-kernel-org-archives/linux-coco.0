Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8141AC952
	for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679411186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DeboSID+flODqx9I+nMKyoD3QHmIkeCvkLB5G/ItUBU=;
	b=Xd0hCw0U5R8nooesi2sC1J62g7JCVT/LRJ1PgGwBkm9agiev+it5CbMcQpGmR2q2op1QNE
	CclrHms/X759dU+CUT1RsSTRRVo4O20ltnicKPWa3P/E5ea9b/h04Nr0phQ/0OQ70puhO2
	9BJnTi/DOpNXxp89Ns5nXasxegF1jDs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-BGWdOEOCPvm-qb8VH2_mIg-1; Tue, 21 Mar 2023 11:06:25 -0400
X-MC-Unique: BGWdOEOCPvm-qb8VH2_mIg-1
Received: by mail-wm1-f72.google.com with SMTP id o42-20020a05600c512a00b003ed26fa6ebdso6025085wms.7
        for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 08:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679411183;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeboSID+flODqx9I+nMKyoD3QHmIkeCvkLB5G/ItUBU=;
        b=3ZNA5WZ2vIuTiUhSp40WNl+fP1+iD0344s2ZmSlSM1xWx36mbLlxajta9ojFPQ//aE
         92Dz7eYGwoL6wkrOUf7Z7jyAgp7cMVJFPwUJJEHlO7hYvBPVk5a7ksHnPDCjgNdcEc5F
         8oAyRDKKzd0ed602hnL1mugUMHnB8w36LavlNgSmXQFEStkhSXeDHXfr1n2h58UeMBDq
         IZ2Bq/fvl4sV2m0vXODw519toWvrwrG5VkVFzrph/9l2umJ1zTlvWScoevYY+Ozjn54v
         vNoNKDZT5X1Q+TlubN3dNB3y85EZqKvKhan71Ea5BTK9XcRQ7nlngUZothkaTFOzear3
         xpQA==
X-Gm-Message-State: AO0yUKXZjnVoqwoNdesZq1Yq4CpaNZeOSN7/okClC/pzS4mA90VUmunl
	P6bEVa3WvgrjqQ7mPtoJrBQVpCCHdq+XHlu0yTVQ03NSlesMt8oK/dLZmxXUVz9axLoAgvsPaqw
	o5GLde2rEU74HuK1jsU2+KA==
X-Received: by 2002:a7b:cd08:0:b0:3e1:f8af:8772 with SMTP id f8-20020a7bcd08000000b003e1f8af8772mr2718086wmj.9.1679411183621;
        Tue, 21 Mar 2023 08:06:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set8hETz/BgtfXVgzBVy6TDRDQShGyhMxRyf2swuVorF+Gi27ydHl0d6lLBUA6v0wHiItH64mag==
X-Received: by 2002:a7b:cd08:0:b0:3e1:f8af:8772 with SMTP id f8-20020a7bcd08000000b003e1f8af8772mr2718060wmj.9.1679411183335;
        Tue, 21 Mar 2023 08:06:23 -0700 (PDT)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id e5-20020a05600c254500b003eb596cbc54sm14078799wma.0.2023.03.21.08.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:06:22 -0700 (PDT)
Date: Tue, 21 Mar 2023 15:06:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Cc: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBnH600JIw1saZZ7@work-vm>
References: <ZBl4592947wC7WKI@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZBl4592947wC7WKI@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Jörg Rödel (jroedel@suse.de) wrote:
> Hi,
> 
> We are happy to announce that last week our secure VM service module
> (SVSM) went public on GitHub for everyone to try it out and participate
> in its further development. It is dual-licensed under the MIT and
> APACHE-2.0 licenses.
> 
> The project is written in Rust and can be cloned from:
> 
> 	https://github.com/coconut-svsm/svsm
> 
> There are also repositories in the github project with the Linux host and
> guest, EDK2 and QEMU changes needed to run the SVSM and boot up a full
> Linux guest.
> 
> The SVSM repository contains an installation guide in the INSTALL.md
> file and contributor hints in CONTRIBUTING.md.
> 
> A blog entry with more details is here:
> 
> 	https://www.suse.com/c/suse-open-sources-secure-vm-service-module-for-confidential-computing/
> 
> We also thank AMD for implementing and providing the necessary changes
> to Linux and EDK2 to make an SVSM possible.

Interesting; it would have been nice to have known about this a little
earlier, some people have been working on stuff built on top of the AMD
one for a while.

You mention two things that I wonder how they interact:

  a) TPMs in the future at a higher ring
  b) Making (almost) unmodified guests

What interface do you expect the guest to see from the TPM - would it
look like an existing TPM hardware interface or would you need some
changes?

Dave

> Have a lot of fun!
> 
> -- 
> Jörg Rödel
> jroedel@suse.de
> 
> SUSE Software Solutions Germany GmbH
> Frankenstraße 146
> 90461 Nürnberg
> Germany
> 
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

