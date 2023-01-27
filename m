Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0122564
	for <linux-coco@lists.linux.dev>; Fri, 27 Jan 2023 09:02:52 +0000 (UTC)
Received: from 8bytes.org (p5b006afb.dip0.t-ipconnect.de [91.0.106.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 244E326300F;
	Fri, 27 Jan 2023 10:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1674810165;
	bh=1kNu2BN86NFgfS60v9TeXvBOhW4cm7kxxYsbD7dJlLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K470ePYqrjCiwz0ijJJNlQ++TeRAjBf0aK2xRN9eM27gInrpuui2C7xyigp1xeBW8
	 XcK+o2wHHs0S3Z0QUnq89CvF+fZhyEKlZP3TY1Y0/6RjhzKPO1vw9D/iYJ7Ivtmkth
	 RD2ffRXX4ysZJq0YHrzFSWpGeXqQymfg0qTccJ2z4d8vE1i9U3FRzGr0xaDhQ4zfsx
	 RCoa31o3hyO5jXXhHxbHNYWw6anQ4fadnFhH3eNSP+t2KaLzXdh/Pz6jOWItm3GB7b
	 k4kuOLctTRcMEFwO74VAfqZbA3V6JTK3jp9Z74bR7cZ1ziPZjWCJU56k3GupAbOMOR
	 8H6e4uEv0HROA==
Date: Fri, 27 Jan 2023 10:02:43 +0100
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
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
	"Michael S. Tsirkin" <mst@redhat.com>,
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
Message-ID: <Y9OTM/itvVnn45p3@8bytes.org>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <Y9Ex3ZUIFxwOBg1n@work-vm>
 <Y9E5Cg7mreDx737N@redhat.com>
 <CAFLxGvwHRK3vyXiCv5ELvrDSEkcDgV5c6pNnWgWhcATfp1dedA@mail.gmail.com>
 <Y9KVHnHnig4jwNPx@work-vm>
 <CAFLxGvyMncqjkEXiOqenQu+rZW46RP7UorXs36+awmgnBxTGhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLxGvyMncqjkEXiOqenQu+rZW46RP7UorXs36+awmgnBxTGhA@mail.gmail.com>

On Thu, Jan 26, 2023 at 04:13:11PM +0100, Richard Weinberger wrote:
> On Thu, Jan 26, 2023 at 3:58 PM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Richard Weinberger (richard.weinberger@gmail.com) wrote:
> > > On Wed, Jan 25, 2023 at 3:22 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > Are you aware of anything that you'd use instead?
> 
> Well, I'd think towards iSCSI over TLS to protect the IO transport.

In the context of confidential computing this makes only sense if the
scsi target is part of the trusted base, which means it needs to be
attested and protected against outside attacks. Currently all CoCo
implementations I know of treat disk storage as untrusted.

Besides that the same problems exist with a VMs encrypted memory. The
hardware does not guarantee that the HV can not fiddle with your private
memory, it only guarantees that you can detect such fiddling and that
the private data is encrypted. The HV can also still trace memory access
patterns of confidential guests by setting the right permissions in the
nested page table.

So storage and memory of a CoCo VM have in common that the transport is
not secure, but there are measures to detect if someone fiddles with
your data on the transport or at rest, for memory implemented in
hardware, and for storage in software by using dm-crypt together with
dm-verity or dm-integrity.

Regards,

	Joerg
