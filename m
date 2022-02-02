Received: from cavan.codon.org.uk (cavan.codon.org.uk [176.126.240.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8FC2F26
	for <linux-coco@lists.linux.dev>; Wed,  2 Feb 2022 07:10:24 +0000 (UTC)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
	id 56FE540A51; Wed,  2 Feb 2022 07:10:23 +0000 (GMT)
Date: Wed, 2 Feb 2022 07:10:23 +0000
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
Message-ID: <20220202071023.GA9489@srcf.ucam.org>
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
 <20220202040157.GA8019@srcf.ucam.org>
 <YfogOurPZb7+Yelo@kroah.com>
 <20220202065443.GA9249@srcf.ucam.org>
 <YfotMyQiQ66xfCOQ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfotMyQiQ66xfCOQ@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Feb 02, 2022 at 08:05:23AM +0100, Greg KH wrote:

> I see different platform patches trying to stick these blobs in
> different locations and ways to access (securityfs, sysfs, char device
> node), which seems crazy to me.  Why can't we at least pick one way to
> access these to start with, and then have the filesystem layout be
> platform-specific as needed, which will give the correct hints to
> userspace as to what it needs to do here?

Which other examples are you thinking of? I think this conversation may 
have accidentally become conflated with a different prior one and now 
we're talking at cross purposes.
