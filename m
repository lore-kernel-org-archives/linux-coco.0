Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C717D4C83
	for <linux-coco@lists.linux.dev>; Wed, 25 Jan 2023 22:03:38 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 57CD330000085;
	Wed, 25 Jan 2023 22:53:33 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 2F7E6260B2D; Wed, 25 Jan 2023 22:53:33 +0100 (CET)
Date: Wed, 25 Jan 2023 22:53:33 +0100
From: Lukas Wunner <lukas@wunner.de>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Shishkin, Alexander" <alexander.shishkin@intel.com>,
	"Shutemov, Kirill" <kirill.shutemov@intel.com>,
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"Kleen, Andi" <andi.kleen@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
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
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	linux-pci@vger.kernel.org
Subject: Re: Linux guest kernel threat model for Confidential Computing
Message-ID: <20230125215333.GA18160@wunner.de>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <Y9Ex3ZUIFxwOBg1n@work-vm>
 <Y9E7PNmSTP5w2zuw@kroah.com>
 <Y9FDZPV7qENtNNyk@work-vm>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9FDZPV7qENtNNyk@work-vm>
User-Agent: Mutt/1.10.1 (2018-07-13)

[cc += Jonathan Cameron, linux-pci]

On Wed, Jan 25, 2023 at 02:57:40PM +0000, Dr. David Alan Gilbert wrote:
> Greg Kroah-Hartman (gregkh@linuxfoundation.org) wrote:
> > Great, so why not have hardware attestation also for your devices you
> > wish to talk to?  Why not use that as well?  Then you don't have to
> > worry about anything in the guest.
> 
> There were some talks at Plumbers where PCIe is working on adding that;
> it's not there yet though.  I think that's PCIe 'Integrity and Data
> Encryption' (IDE - sigh), and PCIe 'Security Prtocol and Data Model' -
> SPDM.   I don't know much of the detail of those, just that they're far
> enough off that people aren't depending on them yet.

CMA/SPDM (PCIe r6.0 sec 6.31) is in active development on this branch:

https://github.com/l1k/linux/commits/doe

It will allow for authentication of PCIe devices.  Goal is to submit
this quarter (Q1).  Afterwards we'll look into retrieving measurements
via CMA/SPDM and bringing up IDE encryption.

It's a kernel-native implementation which uses the existing crypto and
keys infrastructure and is wired into the appropriate places in the
PCI core to authenticate devices on enumeration and reauthenticate
when CMA/SPDM state is lost (after resume from D3cold, after a
Secondary Bus Reset and after a DPC-induced Hot Reset).

The device authentication service afforded here is generic.
It is up to users and vendors to decide how to employ it,
be it for "confidential computing" or something else.

Trusted root certificates to validate device certificates can be
installed into a kernel keyring using the familiar keyctl(1) utility,
but platform-specific roots of trust (such as a HSM) could be
supported as well.

I would like to stress that this particular effort is a collaboration
of multiple vendors.  It is decidedly not a single vendor trying to
shoehorn something into upstream, so the criticism that has been
leveled upthread against other things does not apply here.

The Plumbers BoF you're referring to was co-authored by Jonathan Cameron
and me and its purpose was precisely to have an open discussion and
align on an approach that works for everyone:

https://lpc.events/event/16/contributions/1304/


>    a) there's no good way to authenticate a PCI device yet
>      - any nasty device can claim to have a given PCI ID.

CMA/SPDM prescribes that the Subject Alternative Name of the device
certificate contains the Vendor ID, Device ID, Subsystem Vendor ID,
Subsystem ID, Class Code, Revision and Serial Number (PCIe r6.0
sec 6.31.3).

Thus a forged Device ID in the Configuration Space Header will result
in authentication failure.

Thanks,

Lukas
