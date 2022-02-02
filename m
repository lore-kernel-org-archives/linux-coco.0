Received: from cavan.codon.org.uk (cavan.codon.org.uk [176.126.240.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D9E2F26
	for <linux-coco@lists.linux.dev>; Wed,  2 Feb 2022 06:54:45 +0000 (UTC)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
	id 87B0840A4A; Wed,  2 Feb 2022 06:54:43 +0000 (GMT)
Date: Wed, 2 Feb 2022 06:54:43 +0000
From: Matthew Garrett <mjg59@srcf.ucam.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: James Bottomley <jejb@linux.ibm.com>,
	Dov Murik <dovmurik@linux.ibm.com>, linux-efi@vger.kernel.org,
	Borislav Petkov <bp@suse.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Andi Kleen <ak@linux.intel.com>, Andrew Scull <ascull@google.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Lenny Szubowicz <lszubowi@redhat.com>,
	Peter Gonda <pgonda@google.com>,
	Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
	Jim Cadden <jcadden@ibm.com>,
	Daniele Buono <dbuono@linux.vnet.ibm.com>,
	linux-coco@lists.linux.dev, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nayna Jain <nayna@linux.ibm.com>,
	dougmill@linux.vnet.ibm.com, gcwilson@linux.ibm.com, gjoyce@ibm.com,
	linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, dja@axtens.net
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
Message-ID: <20220202065443.GA9249@srcf.ucam.org>
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
 <20220202040157.GA8019@srcf.ucam.org>
 <YfogOurPZb7+Yelo@kroah.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfogOurPZb7+Yelo@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Feb 02, 2022 at 07:10:02AM +0100, Greg KH wrote:
> On Wed, Feb 02, 2022 at 04:01:57AM +0000, Matthew Garrett wrote:
> > We're talking about things that have massively different semantics.
> 
> I see lots of different platforms trying to provide access to their
> "secure" firmware data to userspace in different ways.  That feels to me
> like they are the same thing that userspace would care about in a
> unified way.

EFI variables are largely for the OS to provide information to the 
firmware, while this patchset is to provide information from the 
firmware to the OS. I don't see why we'd expect to use the same userland 
tooling for both.

In the broader case - I don't think we *can* use the same userland
tooling for everything. For example, the patches to add support for 
manipulating the Power secure boot keys originally attempted to make it 
look like efivars, but the underlying firmware semantics are 
sufficiently different that even exposing the same kernel interface 
wouldn't be a sufficient abstraction and userland would still need to 
behave differently. Exposing an interface that looks consistent but 
isn't is arguably worse for userland than exposing explicitly distinct 
interfaces.
