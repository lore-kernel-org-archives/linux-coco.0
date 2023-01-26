Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF4333F0
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 16:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674750557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uQ5AeqRdHoqDiMiO534YbFssRp+d+rc3l3U4CDokNu0=;
	b=fhQGYpOATd3j+wWS7cdtxzXN9lzb4sNEVHp0geJXFd9BiFFqjsILa6WXtoszo/hmOFgzJ/
	7ybPyOJxQHjdAUo8C0brOdTOkqvNTvhtV6ZAFpjfNs+JkRlhxnlPHZib/SLyoVrRMjr7mH
	J1lJYTVBxDSXW5QHuK0kCMJoVFuDFcI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-ztkHzIqoN5K_NtIvmuDbnQ-1; Thu, 26 Jan 2023 11:29:16 -0500
X-MC-Unique: ztkHzIqoN5K_NtIvmuDbnQ-1
Received: by mail-wr1-f70.google.com with SMTP id w16-20020a5d4b50000000b002bfca568cdfso332477wrs.0
        for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 08:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQ5AeqRdHoqDiMiO534YbFssRp+d+rc3l3U4CDokNu0=;
        b=TZ5uFuJ9lbLxBCFbCBQFzf5Zfdhvd6rtDACHvB0EFSrRJCI/khZXS7pBpwwF4G6GGN
         5Lb7XWl/NYhfA5x40KpShbSpmS1WQqkRLY+AidDTqnoamoh+J7w6WiQ/5HOcteYvcyct
         9faE9GW5t17twRjqC/K8zN6AWqj6L+sE8EVUcNfPJlElpIjTlVw4TATWntTxqCtCbvkv
         knPb+OOnasMQRqYqCXXCwrjyps9eU10ilXfegHcXrizigiA1TrhDa/7D2A3dUxh1bI2o
         eWLv5q+/bW5OxvvKs+vBLd+JEViEdd/tG1nK+D9Ba4EMXz/+tfroQzf0L3OVanueeaCt
         K4Ng==
X-Gm-Message-State: AFqh2kosLGXNgA3iezuBLk1UgJrv7sgE+4ezh5EAE+4h/rfusE4TFqoh
	6loVtmlHih9x0oHXYXjlbDMkiDsQJDVCy2c0df4h2uQmgiv7UDx2znuzxZhQrPnjZ08JB2hIVBo
	qO31MolVgfZLH/SdfQtxHrA==
X-Received: by 2002:a05:600c:1c9d:b0:3da:db4:6105 with SMTP id k29-20020a05600c1c9d00b003da0db46105mr36614927wms.37.1674750554562;
        Thu, 26 Jan 2023 08:29:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/XUMPJtU5iYBp8WyqQ43Iwj8Vmxw+tnCVJfRHeV2qUt/JRWJYMx6HGI88x+KBLozOr/fmeg==
X-Received: by 2002:a05:600c:1c9d:b0:3da:db4:6105 with SMTP id k29-20020a05600c1c9d00b003da0db46105mr36614890wms.37.1674750554324;
        Thu, 26 Jan 2023 08:29:14 -0800 (PST)
Received: from redhat.com ([2.52.137.69])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c05c800b003c65c9a36dfsm1742661wmd.48.2023.01.26.08.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 08:29:13 -0800 (PST)
Date: Thu, 26 Jan 2023 11:29:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Kernel Hardening <kernel-hardening@lists.openwall.com>
Subject: Re: Linux guest kernel threat model for Confidential Computing
Message-ID: <20230126105618-mutt-send-email-mst@kernel.org>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <DM8PR11MB5750FA4849C3224F597C101AE7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <DM8PR11MB5750FA4849C3224F597C101AE7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 25, 2023 at 03:29:07PM +0000, Reshetova, Elena wrote:
> And this is a very special aspect of 'hardening' since it is about hardening a kernel
> under different threat model/assumptions. 

I am not sure it's that special in that hardening IMHO is not a specific
threat model or a set of assumptions. IIUC it's just something that
helps reduce severity of vulnerabilities.  Similarly, one can use the CC
hardware in a variety of ways I guess. And one way is just that -
hardening linux such that ability to corrupt guest memory does not
automatically escalate into guest code execution.

If you put it this way, you get to participate in a well understood
problem space instead of constantly saying "yes but CC is special".  And
further, you will now talk about features as opposed to fixing bugs.
Which will stop annoying people who currently seem annoyed by the
implication that their code is buggy simply because it does not cache in
memory all data read from hardware. Finally, you then don't really need
to explain why e.g. DoS is not a problem but info leak is a problem - when
for many users it's actually the reverse - the reason is not that it's
not part of a threat model - which then makes you work hard to define
the threat model - but simply that CC hardware does not support this
kind of hardening.

-- 
MST

