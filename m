Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCF76FA1
	for <linux-coco@lists.linux.dev>; Wed, 25 Jan 2023 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674668876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u1uz/WvR1kntJCHUcdHEFPXiKPk90yS9eZtHwp4ILXA=;
	b=cbceCvAdpuLN+vpDyPUNmIzYpz8PJQ+9AjVXIvZaooLPS3JF+llMqptkSOs9BcfYyP+i2H
	wYnDKlDsMmeAuiYaP5H7BDyHnqE8JkhSzAeKPCwNHAqL93786T4iLAESxwUSzhYpqOBN7f
	RE0ddher+JA6BQ3k/jxMUj0CGqnZZtM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-RcVc-aMKPBWZ07tAQ9Og-A-1; Wed, 25 Jan 2023 12:47:55 -0500
X-MC-Unique: RcVc-aMKPBWZ07tAQ9Og-A-1
Received: by mail-ed1-f71.google.com with SMTP id z20-20020a05640240d400b0049e1b5f6175so13308450edb.8
        for <linux-coco@lists.linux.dev>; Wed, 25 Jan 2023 09:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1uz/WvR1kntJCHUcdHEFPXiKPk90yS9eZtHwp4ILXA=;
        b=b/+GFyCNzoNcLnCcUnsFEIx01/6dfTR+n8xGb3oqz0ilC/oeIOoYWXfdg3TBoR3pLD
         W2GpejFSim/ItwYZEPvvMj7lLNtlpa2Hhi3wLqwMsihJHDYeSfsvmKszH6vXHlRFr1xr
         6cqda9x5FZjZEF/cdUvM5arofOjcfvl4PGb0pTQXc3zboyFZsA5Iiej63z5TV8LmLlXI
         RysdlCN26gGdOycTa/3dzs58I21cioriHXJPBJ8DKPY/BVJQM+56ZaD4Q7WA9xww7UcG
         AMaJi1OlX1q5UvQd1q6CJMbpH4K9g9Ol9gUO7Cj4Peq+kLtl9vDSHMBjCseq7HoWfd+a
         K6CA==
X-Gm-Message-State: AFqh2kpiBq+IwjvvAAc4FGziQaVZ4KUnfAZ7KEcZWnmkew+Cx2MVqFoZ
	9bbZXXsUQBgiyxJWpvdCDaDU5bqoRqrVubPUP5s6G+Z+CqXyjrf2Zp0bV6T7zdJpb8qRtGmcxPf
	jDnxh0Tfhvir93y6hFYwM8A==
X-Received: by 2002:a17:906:d8ab:b0:86f:50ff:ef25 with SMTP id qc11-20020a170906d8ab00b0086f50ffef25mr34825561ejb.63.1674668873976;
        Wed, 25 Jan 2023 09:47:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu83KIXwbXDlz56GSTdcHSfE99QpzGf+xdVZqmgb3riyzbl08F66jpRPNN+enycBK7H3mnwIg==
X-Received: by 2002:a17:906:d8ab:b0:86f:50ff:ef25 with SMTP id qc11-20020a170906d8ab00b0086f50ffef25mr34825532ejb.63.1674668873829;
        Wed, 25 Jan 2023 09:47:53 -0800 (PST)
Received: from redhat.com ([2.52.134.175])
        by smtp.gmail.com with ESMTPSA id i25-20020a170906265900b007ae10525550sm2660416ejc.47.2023.01.25.09.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 09:47:53 -0800 (PST)
Date: Wed, 25 Jan 2023 12:47:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Shishkin, Alexander" <alexander.shishkin@intel.com>,
	"Shutemov, Kirill" <kirill.shutemov@intel.com>,
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"Kleen, Andi" <andi.kleen@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	"Wunner, Lukas" <lukas.wunner@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"Poimboe, Josh" <jpoimboe@redhat.com>,
	"aarcange@redhat.com" <aarcange@redhat.com>,
	Cfir Cohen <cfir@google.com>, Marc Orr <marcorr@google.com>,
	"jbachmann@google.com" <jbachmann@google.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	James Morris <jmorris@namei.org>,
	Michael Kelley <mikelley@microsoft.com>,
	"Lange, Jon" <jlange@microsoft.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linux guest kernel threat model for Confidential Computing
Message-ID: <20230125124543-mutt-send-email-mst@kernel.org>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <Y9Ex3ZUIFxwOBg1n@work-vm>
 <Y9E7PNmSTP5w2zuw@kroah.com>
 <Y9FDZPV7qENtNNyk@work-vm>
 <Y9FHsvVoPbgMR2s3@kroah.com>
 <20230125103816-mutt-send-email-mst@kernel.org>
 <20230125160203.z4ttwlgclfd54pc6@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230125160203.z4ttwlgclfd54pc6@box.shutemov.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 25, 2023 at 07:02:03PM +0300, Kirill A. Shutemov wrote:
> On Wed, Jan 25, 2023 at 10:45:48AM -0500, Michael S. Tsirkin wrote:
> > On Wed, Jan 25, 2023 at 04:16:02PM +0100, Greg Kroah-Hartman wrote:
> > > Everyone wants a subset, different from other's subset, which means you
> > > need them all.  Sorry.
> > 
> > Well if there's a very popular system (virtual in this case) that needs
> > a specific config to work well, then I guess
> > arch/x86/configs/ccguest.config or whatever might be acceptable, no?
> > Lots of precedent here.
> 
> OS vendors want the single kernel that fits all sizes: it should be
> possible (and secure) to run a generic disto kernel within TDX/SEV guest.

If they want that, sure. But it then becomes this distro's
responsibility to configure things in a sane way. At least if
there's a known good config that's a place to document what
is known to work well. No?

-- 
MST

