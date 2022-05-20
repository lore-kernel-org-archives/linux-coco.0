Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4309A7E
	for <linux-coco@lists.linux.dev>; Fri, 20 May 2022 15:56:17 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id C8AF3246; Fri, 20 May 2022 17:48:18 +0200 (CEST)
Date: Fri, 20 May 2022 17:48:17 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-sgx@vger.kernel.org
Cc: Andi Kleen <ak@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	David Kaplan <David.Kaplan@amd.com>,
	David Rientjes <rientjes@google.com>,
	Joerg Roedel <jroedel@suse.de>,
	Jun Nakajima <jun.nakajima@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Marc Orr <marcorr@google.com>, Mike Rapoport <rppt@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Gonda <pgonda@google.com>,
	Sathya Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: [CFP LPC 2022] Confidential Computing Microconference
Message-ID: <Yoe4QZr8dqy1hrU1@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

as already announced by the planning committee, there will be another

	Confidential Computing Microconference

at this years Linux Plumbers Conference (LPC) happening from 12th to
14th of September in Dublin, Ireland.

In this microconference we want to discuss ongoing developments around
Linux support for memory encryption and support for Confidential
Computing in general.

Suggested topics are:

	* Design and implementation of Intel TDX and AMD SEV-SNP host
	  support

	* Linux kernel memory management changes for secure execution
	  environments

	* Support of upcoming secure execution hardware extensions
	  from ARM and RISC-V

	* Pre-launch and runtime attestation workflows

	* Interrupt security for AMD SEV-SNP

	* Debuggability and live migration of encrypted virtual machines

	* Proper testing of confidential computing support code

	* Support for Confidential Containers

	* Or anything else related to Confidential Computing in Linux

Please submit your proposals on the LPC website at:

	https://lpc.events/event/16/abstracts/

Make sure to select "Confidential Computing MC" in the Track pulldown
menu.

Looking forwart to seeing you all there, either in Dublin or virtual :)

Thanks,

	Joerg
