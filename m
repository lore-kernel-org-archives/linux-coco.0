Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAE05689
	for <linux-coco@lists.linux.dev>; Tue, 15 Aug 2023 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=al9YvRhXrCID7rvrAGEaXvsCD6aM0+cRJENNBXgLi/Q=; b=lMbv5Z33BcMEFd+CDt5zk+R+qL
	my9RDkxgQ+RmwqydkBpUBfoe0jm25tnmOk0ASqXNBdr9t0vS8qwGfnaqNBGcZJlqK8nSNlXBoRrQk
	y6n7MoCKo1HuRFv/86B2EJMx3XA7XjDT+hvZBUvja7/3Zd4j/VD+JjmqDkCqm9sErALYpqzQlHKjF
	ICsGBZFS071ikSCJcTglQhxqUyjfZz/338UG/MAwQywZb41fg2EePGVDson1mVKDhJkfTq68vLW1D
	yjjNcrMVyNsj9tiHlLMje4mhcWBUqxGBv5lbXaoVu54TbxIoes1+SRAOTKy6WgiGuLphGo1SfJffW
	BBmwhHrQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qVpYW-00Biwe-2w;
	Tue, 15 Aug 2023 08:37:37 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4A145300222;
	Tue, 15 Aug 2023 10:37:36 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2E8B720307341; Tue, 15 Aug 2023 10:37:36 +0200 (CEST)
Date: Tue, 15 Aug 2023 10:37:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 5/5] virt: sevguest: Add TSM_REPORTS support for
 SNP_{GET, GET_EXT}_REPORT
Message-ID: <20230815083736.GA927436@hirez.programming.kicks-ass.net>
References: <169199898909.1782217.10899362240465838600.stgit@dwillia2-xfh.jf.intel.com>
 <169199901829.1782217.16990408177897780160.stgit@dwillia2-xfh.jf.intel.com>
 <20230814112144.GF776869@hirez.programming.kicks-ass.net>
 <64da55624c6c1_2138e294cf@dwillia2-xfh.jf.intel.com.notmuch>
 <20230814164804.GO776869@hirez.programming.kicks-ass.net>
 <20230814221503.GA919179@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814221503.GA919179@hirez.programming.kicks-ass.net>

On Tue, Aug 15, 2023 at 12:15:03AM +0200, Peter Zijlstra wrote:

> This seems to actually work. I'll try and write some coherent comments
> tomorrow -- it's definitely too late for that now.

Clearly I should have gone to bed before sending this patch, not after.
Let me try that again.
