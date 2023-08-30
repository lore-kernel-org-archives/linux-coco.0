Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49E52F5E
	for <linux-coco@lists.linux.dev>; Wed, 30 Aug 2023 20:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C5EC433C8;
	Wed, 30 Aug 2023 20:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693428405;
	bh=9PpwDOZlrXxmM5h+/8DH4Tb0Qdk2qGewp9UCJh/JT3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fgke78mPM5hsHAZDMRaxYQZQ1V/50qjDZkXY17NAIz8RR4li2IIZWpcDUhSXQvzx4
	 kieFOx+TOYG4fHJcspfcRe6YJuMPxsWV/zVkVYcN+mBHVrdW9sw1RX+zeOoTvPpUYj
	 UCFBDdXyZUeSu/OBR8vYd5YzRmB0BoQnA1oriqYo=
Date: Wed, 30 Aug 2023 22:46:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	tglx@linutronix.de
Subject: Re: [PATCH v3 4/5] mm/slab: Add __free() support for kvfree
Message-ID: <2023083034-grimace-panhandle-f332@gregkh>
References: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
 <169342401666.3934343.5520453508283712955.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169342401666.3934343.5520453508283712955.stgit@dwillia2-xfh.jf.intel.com>

On Wed, Aug 30, 2023 at 12:33:36PM -0700, Dan Williams wrote:
> Allow for the declaration of variables that trigger kvfree() when they
> go out of scope. The check for NULL and call to kvfree() can be elided
> by the compiler in most cases, otherwise without the NULL check an
> unnecessary call to kvfree() may be emitted. Peter proposed a comment
> for this detail [1].
> 
> Link: http://lore.kernel.org/r/20230816103102.GF980931@hirez.programming.kicks-ass.net [1]
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  include/linux/slab.h |    2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
