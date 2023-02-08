Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6147F9458
	for <linux-coco@lists.linux.dev>; Wed,  8 Feb 2023 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675848673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fL9GfO9S2K1ILUcSG3jhywAqIETi3NhaIzZtWMIxF3Q=;
	b=COCHFpL+p43d9U8pISn6f17FSbQJifyAAE/XLdu2yUxYjLJV08KDpMzSAXbr1UztmN56We
	kcQIp8d6t0mrrKIWUsSHq8N3W0phux5+iW3Lh1sWiUdzCL4G9w2LyzeF1HdYaQ5PhUwNKs
	fWe+naRkha5lL4jCxh74HNsw76dbYpg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-65-b0t3Ep1uPPCo9i9qkVfDJg-1; Wed, 08 Feb 2023 04:31:10 -0500
X-MC-Unique: b0t3Ep1uPPCo9i9qkVfDJg-1
Received: by mail-wr1-f70.google.com with SMTP id w10-20020a5d544a000000b002c3de7a10b0so1731153wrv.5
        for <linux-coco@lists.linux.dev>; Wed, 08 Feb 2023 01:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL9GfO9S2K1ILUcSG3jhywAqIETi3NhaIzZtWMIxF3Q=;
        b=dfxXyuuSntI8TUJfdHgMevuDdqHfTJBdqPVq5E1OCpdN93/JIx1CBraw8IhLZkZIzB
         hpKo6TXJZ0fZ5Qvbs2+FL7In/QfiOOSf9Jssv44EPm7nVAnQI+IpFaRET6NSL/4Bx3Zb
         mSPHc4MIvmhk5Zlqz5VDYu6YHddHItIt5rO0FLq6vkGOE2ja7j37Z2NnhEFkF7DSEMKf
         47zc7ulm5FYAovhTyodXgV48tSt7iPMmk7SAJVaIwM1cBt6gFQQngb1XA9c2ck/ilV6j
         HYzP7BvCKQqHEShHRnRYqXe81o3M0UaMmqXt94BAE4HylWP9oTCvsf9lXRhjwNhfJLHT
         ouhA==
X-Gm-Message-State: AO0yUKVbHAXK9hCjYnkDYr8zofz/C5A6rUQTBzOvYmFcIW65nR/K2bH1
	jhNI0Pr0wxuac/1zaIkuyZ3hP2Xb/37go+j/Uq0nbSWELiVaxYkezTyrrmSn+cZnL8SQRZxubHp
	HbFZtYwvPLWbyo2Rv7jDkvw==
X-Received: by 2002:a05:6000:1292:b0:2c3:ee54:329c with SMTP id f18-20020a056000129200b002c3ee54329cmr5741590wrx.20.1675848668861;
        Wed, 08 Feb 2023 01:31:08 -0800 (PST)
X-Google-Smtp-Source: AK7set+Cv8zXvOPTnPh2THy62/kNJt0WXub9wk7PPNyX7ucyEWbsPyMRJbfOjX0YmN8S3uIeh5SNdw==
X-Received: by 2002:a05:6000:1292:b0:2c3:ee54:329c with SMTP id f18-20020a056000129200b002c3ee54329cmr5741562wrx.20.1675848668686;
        Wed, 08 Feb 2023 01:31:08 -0800 (PST)
Received: from redhat.com ([2.52.156.127])
        by smtp.gmail.com with ESMTPSA id e6-20020a5d6d06000000b002be099f78c0sm13818376wrq.69.2023.02.08.01.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 01:31:07 -0800 (PST)
Date: Wed, 8 Feb 2023 04:31:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Carlos Bilbao <carlos.bilbao@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <20230208041913-mutt-send-email-mst@kernel.org>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <658272b5-9547-a69f-b6c9-a7ff2dd2d468@amd.com>
 <Y+HpmIesY96cYcWQ@kroah.com>
 <20044cae-4fab-7ef6-02a0-5955a56e5767@amd.com>
 <Y+MAPHZNLeBY13Pj@mit.edu>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y+MAPHZNLeBY13Pj@mit.edu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 07, 2023 at 08:51:56PM -0500, Theodore Ts'o wrote:
> Why not just simply compile a special CoCo kernel that doesn't have
> any drivers that you don't trust.

Or at least, start with that? You can then gradually expand that until
some config is both acceptable to distros and seems sufficiently trusty
to the CoCo project. Lots of kernel features got upstreamed this way.
Requirement to have an arbitrary config satisfy CoCo seems like a very
high bar to clear.

-- 
MST

