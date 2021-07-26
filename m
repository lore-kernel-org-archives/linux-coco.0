Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438BF70
	for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 18:55:34 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 99991296; Mon, 26 Jul 2021 20:55:25 +0200 (CEST)
Date: Mon, 26 Jul 2021 20:55:24 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Marc Orr <marcorr@google.com>
Cc: Andi Kleen <ak@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>,
	Andy Lutomirski <luto@kernel.org>, Joerg Roedel <jroedel@suse.de>,
	David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86 <x86@kernel.org>,
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <YP8FHHRnf6utkvd/@8bytes.org>
References: <YPV27hDPZUoVsIZt@suse.de>
 <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
 <aa564856-36c7-ae19-7a82-17638cdf5ec1@linux.intel.com>
 <CAA03e5EDGdD05+PQsfv+b3ce_4SaMrmXsVGq292D2Gxjs6Xr8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA03e5EDGdD05+PQsfv+b3ce_4SaMrmXsVGq292D2Gxjs6Xr8A@mail.gmail.com>

On Thu, Jul 22, 2021 at 10:31:27AM -0700, Marc Orr wrote:
> IMHO, we need to be completely certain that guest data cannot be
> compromised if we're going to remove the requirement that guest memory
> only be validated once in a certain state (e.g., from within a crash
> kernel). Perhaps it is the case that we're certain that guest data
> cannot be compromised from within a crash kernel -- but it's not what
> I read in the email exchange.

Right, at least SNP has a strict requirement that no memory could be
validated or invalidated twice without giving up security guarantees for
that memory.

Regards,

	Jörg
