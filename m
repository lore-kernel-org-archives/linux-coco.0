Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C817771
	for <linux-coco@lists.linux.dev>; Wed, 12 May 2021 16:00:34 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 7621E247; Wed, 12 May 2021 18:00:32 +0200 (CEST)
Date: Wed, 12 May 2021 18:00:31 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, Hyunwook Baek <baekhw@google.com>,
	Joerg Roedel <jroedel@suse.de>, stable@vger.kernel.org,
	hpa@zytor.com, Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Slaby <jslaby@suse.cz>,
	Dan Williams <dan.j.williams@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
	David Rientjes <rientjes@google.com>, Cfir Cohen <cfir@google.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mike Stunes <mstunes@vmware.com>,
	Sean Christopherson <seanjc@google.com>,
	Martin Radev <martin.b.radev@gmail.com>,
	Arvind Sankar <nivedita@alum.mit.edu>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 3/6] x86/sev-es: Use __put_user()/__get_user
Message-ID: <YJv7n9aZPiQYgdmf@8bytes.org>
References: <20210512075445.18935-1-joro@8bytes.org>
 <20210512075445.18935-4-joro@8bytes.org>
 <9282239c-138c-7226-88d3-a5611d11cccd@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9282239c-138c-7226-88d3-a5611d11cccd@intel.com>

On Wed, May 12, 2021 at 08:57:53AM -0700, Dave Hansen wrote:
> The changelog _helps_, but using a "user" function to handle kernel MMIO
> for its error handling properties seems like it's begging for a comment.
> 
> __put_user() also seems to have fun stuff like __chk_user_ptr().  It all
> seems sketchy to me.

Yeah, as Juergen already pointed out, there are certain problems with
that too. But I don't want to write my own accessors, so I will
introduce a separate user and kernel path to these functions.

Regards,

	Joerg
